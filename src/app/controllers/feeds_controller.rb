class FeedsController < ApplicationController
    def home
        @interests = User.find(current_user.id).skills # For the interests sidebar

        # The following logic determines which mentor cards are displayed to the user based upon whether they have selected an interest in the sidebar, or made a search query. The @sample variables store the query for user cards, the @category returns the pages h1 value, and the @true is for the navbar active page highlighting.
        if feed_params[:interest] == "random"
            @sample = Service.all.sample(99)
            @category = "Mentors From All Categories"
            @true = true
        
        elsif feed_params[:interest] == "all" # runs this when the 'all' button in the sidebar is clicked.
            @category = "Mentors From My Interests"
            @sample = Service.includes(:user).where(skill_id: User.find(current_user.id).interests.pluck(:skill_id).to_a).sample(99)
            @true = true

        elsif feed_params[:interest] # run this when interest parameter is present, via clicking it in the interest bar.
            @sample = Service.includes(:skill).where(skill_id: Skill.find_by(name: feed_params[:interest]).id)
            @category = "#{feed_params[:interest]} Mentors"

        elsif feed_params[:search] # run this when the search parameter is present:
            @category = "#{feed_params[:search].titleize} Mentors"
            @search = Skill.fuzzy_search(feed_params[:search])

            if @search.empty?
                flash[:error] = "Sorry there are no mentors for that category yet."
                redirect_to root_path(interest: "random")
            else
                @sample = Service.where(skill_id: @search[0].id)
            end

        else # otherwise run this if there's no parameters:
            @sample = Service.all.sample(99)
            @category = "Mentors From All Categories"
        end
    end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
        params.permit(:interest, :search)
    end
end