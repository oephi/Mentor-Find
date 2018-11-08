class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  def index
    @interests = Interest.all
  end

  def show
  end

  def new
    @interest = Interest.new
  end

  def edit
  end

  def create
    if params[:interest].empty?
      flash[:alert] = "Interest can't be empty."
    elsif Skill.exists?(name: params[:interest])
      @skill = Skill.find_by(name: interest_params[:interest]).id
      flash[:alert] = "You're already interested in that."
    elsif interest_params[:interest].strip.downcase.empty?
      flash[:alert] = "Interest can't be blank."
    else
      @skill = current_user.skills.create(name: interest_params[:interest]).id
      flash[:notice] = "You've successfully added #{params[:interest]} to your interest list."
    end

    redirect_to root_path
  end

  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to @interest, notice: 'Interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest }
      else
        format.html { render :edit }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Interest.find_by(user_id: current_user.id, skill_id: params[:id]).destroy
    redirect_to root_path, notice: 'Interest was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.permit(:interest)
    end
end
