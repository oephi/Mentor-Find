class ChargesController < ApplicationController
    def new
    end
    
    def create
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
