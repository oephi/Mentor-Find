class FeedsController < ApplicationController
    def home
        #@sample = Service.take(100) #TODO
        @interests = User.find(current_user.id).skills # for the interests sidebar
        @category = params[:interest] # for the feeds h1 #TODO: Add an if/then condition for :interest/:search

        if params[:interest] # run this when interest parameter is present:
            @sample = Skill.find_by(name: params[:interest]).interests.where(user_id: current_user.id)
        elsif params[:search] # run this when the search parameter is present:
            @links = Link.fuzzy_search(params[:search][:term]).where(user_id: current_user.id, read: nil)
        else # otherwise run this if there's no parameters:
            @sample = Service.take(100)
        end

        #TODO: add the `all` tag logic
    end
end