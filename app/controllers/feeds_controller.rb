class FeedsController < ApplicationController
    def home
        @interests = User.find(current_user.id).skills # for the interests sidebar

        if params[:interest] == "random"
            @sample = Service.all.sample(99) # old: order("RANDOM()").take(99)
            @category = "Mentors From All Categories"
            @class = 'active'
        
        elsif params[:interest] == "all"
            @category = "Mentors From My Interests"
            
            @sample = Service.where(skill_id: User.find(current_user.id).interests.pluck(:skill_id)).sample(99)

        elsif params[:interest] # run this when interest parameter is present:
            @sample = Service.where(skill_id: Skill.find_by(name: params[:interest]).id)
            @category = "#{params[:interest].titleize} Mentors" # for the feeds h1

        elsif params[:search] # run this when the search parameter is present:
            @category = "#{params[:search]} Mentors"
            @search = Skill.fuzzy_search(params[:search])

            if @search.empty?
                # @sample = Service.take(99)
                flash[:error] = "Sorry there are no mentors for that category yet."
                redirect_to root_path(interest: "random")
            else
                @sample = Service.where(skill_id: @search[0].id)
            end

        else # otherwise run this if there's no parameters:
            @sample = Service.all.sample(99) # old: order("RANDOM()").take(99)
            @category = "Mentors From All Categories"
            @class = 'active'
        end
        # TODO: DRY the else and first conditions out.

    end

    def show
        @interests = current_user.interests #? 
        @reviews = current_user.services #?
        
        @services = Service.where(user_id: current_user.id)
        @description = User.find(current_user.id).description

    end
end