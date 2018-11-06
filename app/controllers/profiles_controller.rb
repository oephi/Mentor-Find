class ProfilesController < ApplicationController
    def index
        @interests = current_user.interests #? 
        @reviews = current_user.services #?

        @services = Service.where(user_id: current_user.id)
        @description = User.find(current_user.id).description
    end

    def show
        @user = Service.find(params[:id]).user
        @services = Service.where(user_id: @user.id)

        @service_ids = Service.where(user_id: @user.id).pluck(:id)
        @reviews_received = Review.where(service_id: @service_ids)
        if @reviews_received.empty?
            @received_error = "They haven't received any."
        else
            @reviews_received
        end


        # byebug
        if @user.reviews.empty?
            @left_error = "They haven't left any."
        else
            @reviews_left = @user.reviews
        end


    end

end