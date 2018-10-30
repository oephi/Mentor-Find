class FeedsController < ApplicationController
    def home
        @sample = User.take(100)
    end
end