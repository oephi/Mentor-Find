class ProfilesController < ApplicationController
    def index
        @interests = current_user.interests #? 
        @reviews = current_user.services #?

        @services = Service.where(user_id: current_user.id)
        @description = User.find(current_user.id).description
    end

    def show
        @user = Service.find(params[:id]).user
        @services = Service.where(user_id: Service.find(params[:id]).user.id)
    end

end