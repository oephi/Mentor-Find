class FeedsController < ApplicationController
    def home
        @sample = Service.take(100) #TODO
        @interests = User.find(current_user.id).skills 
    end

    def show
        @interests = current_user.interests
    end
end