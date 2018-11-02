class FeedsController < ApplicationController
    def home
        @interests = User.find(current_user.id).skills # for the interests sidebar

        if params[:interest] == "random"
            @sample = Service.all.sample(99) # old: order("RANDOM()").take(99)
            @category = "Mentors in Everything Near You"
            @class = 'active'

        
        elsif params[:interest] == "all"
            #@sample = Interest.where(user_id: current_user.id)
            #@sample = Service.where(skill_id: Interest.where(user_id: current_user.id))
            #@sample = Interest.where(user_id: current_user.id).each { |interest| 
            #           Skill.find(interest.skill_id).services }


            @category = "Your Mentors Near You"
            interests = User.find(current_user.id).skills.pluck(:id)
            @sample = Service.where(skill_id:interests)


        elsif params[:interest] # run this when interest parameter is present:
            #@sample = Skill.find_by(name: params[:interest]).interests.where(user_id: current_user.id)
            @sample = Service.where(skill_id: Skill.find_by(name: params[:interest]).id)
            @category = params[:interest] # for the feeds h1



        elsif params[:search] # run this when the search parameter is present:
            # @search = Skill.fuzzy_search(name: params[:search])
            #@sample = Service.where(skill_id:  )
            #@sample = Service.where(skill_id: Skill.find_by(name: params[:interest]).id)

            @category = "#{params[:search]} Mentors"

            @sample = Service.where(skill_id: Skill.fuzzy_search(params[:search])[0].id)

            # if @sample.nil?
            #     @sample = 



        else # otherwise run this if there's no parameters:
            @sample = Service.take(99) #TODO: make this only for current user 
            @category = "Your Mentors Near You"
        end

    end
end