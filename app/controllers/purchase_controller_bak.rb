class PurchasesController < ApplicationController
    before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  
    def index
      purchases = Purchase.where(user_id: current_user.id)
  
      if purchases.empty?
        @purchases = "It looks like you haven't made any purchases yet."
        @flash = flash.now[:error] = "It looks like you haven't made any purchases yet."
      else
        @purchases = Stripe::Charge.list({customer: current_user.customer_id})
      end
      
  
    end
  
    # GET /purchases/1
    # GET /purchases/1.json
    def show 
    end
  
    # GET /purchases/new
    def new
      @purchase = Purchase.new()
    end
  
    # GET /purchases/1/edit
    def edit
    end
  
    # POST /purchases
    # POST /purchases.json
    def create
      # @purchase = Purchase.new(purchase_params)
      # Purchase.create(
      #   service_id:
      #   user_id:
      #   charge_id:
      #   price:
      # )
  
      # respond_to do |format|
      #   if @purchase.save
      #     format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
      #     format.json { render :show, status: :created, location: @purchase }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @purchase.errors, status: :unprocessable_entity }
      #   end
      # end
  
        # Amount in cents
        @amount = (params[:amount].to_f * 100).round 
      
        customer = Stripe::Customer.retrieve(current_user.customer_id)
        customer.source = params[:stripeToken]
        customer.save
  
        charge = Stripe::Charge.create(
          :customer             => current_user.customer_id,
          :amount               => @amount,
          :description          => 'Rails Stripe customer',
          :currency             => 'aud',
          :statement_descriptor => 'Custom descriptor',
          :capture              => false,
          :metadata             => {'service_id' => params[:service]}
        )
          
        redirect_to services_path
  
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      end
    end
  
    # PATCH/PUT /purchases/1
    # PATCH/PUT /purchases/1.json
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
  
    # DELETE /purchases/1
    # DELETE /purchases/1.json
    def destroy
      @purchase.destroy
      respond_to do |format|
        format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_purchase
        @purchase = Purchase.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def purchase_params
        params.require(:purchase).permit(:service_id, :user_id, :charge_id, :price)
      end
  end
  