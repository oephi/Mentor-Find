class FeedsController < ApplicationController
    def home
        #@sample = Service.take(100) #TODO
        @interests = User.find(current_user.id).skills # for the interests sidebar

        if params[:interest] # run this when interest parameter is present:
            @sample = Skill.find_by(name: params[:interest]).interests.where(user_id: current_user.id)
            @category = params[:interest] # for the feeds h1
        elsif params[:search] # run this when the search parameter is present:
            # @search = Skill.fuzzy_search(name: params[:search])
            @category = "#{params[:search]} Mentors"
        else # otherwise run this if there's no parameters:
            @sample = Service.take(99)
            @category = "Mentors Near You"
        end

        #TODO: add the `all` tag logic
    end
end