class FeedsController < ApplicationController
    def home
        @sample = Service.take(100) #TODO
        @interests = User.find(current_user.id).skills 

        # if params[:tag] #with tags
        #     @links = Tag.find_by(name: params[:tag]).links.where(user_id: current_user.id, read: nil)
        #     @read_links = Tag.find_by(name: params[:tag]).links.where(user_id: current_user.id, read: "true")
        # elsif params[:search]  #render json: params  #with tags
        #     @links = Link.fuzzy_search(params[:search][:term]).where(user_id: current_user.id, read: nil)
        #     @read_links = Link.fuzzy_search(params[:search][:term]).where(user_id: current_user.id, read: "true")
        # else #no tags
        #     @links = Link.where(user_id: current_user.id, read: nil)
        #     @read_links = Link.where(user_id: current_user.id, read: "true")
        # end
    end


end