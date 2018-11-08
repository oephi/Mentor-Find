class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    purchases = Purchase.where(user_id: current_user.id)

    if purchases.empty?
      @purchases = "It looks like you haven't made any purchases yet."
      @flash = flash.now[:error] = "It looks like you haven't made any purchases yet."
    else
      @purchases = Purchase.where(user_id: current_user.id)
    end    
  end

  def show 
  end

  def new
    @service = Service.new(skill_id: params[:service_id])    
  end

  def edit
  end

  def create
      # Amount in cents
      @amount = (params[:service_values][:price].to_f * 100).round
    
      customer = Stripe::Customer.retrieve(current_user.customer_id)
      customer.source = params[:stripeToken]
      customer.save

      # Stripe charge instatiation.  This gets sent to stripe
      charge = Stripe::Charge.create(
        :customer             => current_user.customer_id,
        :amount               => @amount,
        :description          => 'Rails Stripe customer',
        :currency             => 'aud',
        :statement_descriptor => 'Custom descriptor',
        :receipt_email        => current_user.email,
        :metadata             => {'service_id' => params[:service_values][:id]}
      )

        # Instanatiating purchase information into application database for purchase history
       @purchase = Purchase.create(
        service_id: charge.metadata.service_id,
        user_id: current_user.id,
        charge_id: charge.id,
        price: (charge.amount / 100)
        )  
      
        @purchase.save
        
        flash[:notice] = "Your payment to #{ @purchase.service.user.name } was successful!  Your Mentor will be in touch with you shortly."
      redirect_to purchases_path


    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:service_id, :user_id, :charge_id, :price)
    end
end
