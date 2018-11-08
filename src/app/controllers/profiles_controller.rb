class ProfilesController < ApplicationController
    def show
        @user = User.find(params[:id])
        @services = Service.where(user_id: @user.id)

        @service_ids = Service.where(user_id: @user.id).pluck(:id)
        @reviews_received = Review.where(service_id: @service_ids)
        if @reviews_received.empty?
            @received_error = "They haven't received any."
        else
            @reviews_received
        end

        if @user.reviews.empty?
            @left_error = "They haven't left any."
        else
            @reviews_left = @user.reviews
        end
    end
end