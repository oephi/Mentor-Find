class ChargesController < ApplicationController
    def new
    end
    
    def create
      # Amount in cents
      @amount = 500
    
      customer = Stripe::Customer.retrieve(current_user.customer_id)
      customer.source = params[:stripeToken]
      customer.save

      charge = Stripe::Charge.create(
        :customer    => current_user.customer_id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'aud'
      )
        

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
