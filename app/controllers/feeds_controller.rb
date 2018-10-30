class FeedsController < ApplicationController
    def home
        @sample = User.take(100)
        @interests = User.find(current_user.id).skills 
    end
end