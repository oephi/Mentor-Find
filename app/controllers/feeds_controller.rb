class FeedsController < ApplicationController
    def home
        byebug
        @sample = User.take(100)
        @interests = User.find(current_user.id).skills 
    end
end