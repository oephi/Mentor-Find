class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  # GET /interests
  # GET /interests.json
  def index
    @interests = Interest.all
  end

  # GET /interests/1
  # GET /interests/1.json
  def show
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
  end


  # POST /interests
  def create
    @user = User.find(current_user.id)
    # @user.skills.create(name: params[:interest])
    # @interest = Interest.new(interest_params)

    if Skill.exists?(name: params[:interest]) #TODO: add strong params here
      @skill = Skill.find_by(name: params[:interest]).id
    else
      @user.skills.create(name: params[:interest]).id
    end

    unless @user.skills.pluck(:name).include?(params[:interest]) #TODO: strong params here as well.
      @user.interests.create(skill_id: @skill)
    else
      flash[:alert] = "You're already interested in that." #TODO: why is this showing??
    end

    redirect_back fallback_location: root_path
  end


  # PATCH/PUT /interests/1
  # PATCH/PUT /interests/1.json
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

  # DELETE /interests/1
  # DELETE /interests/1.json
  def destroy
    Interest.find_by(user_id: current_user.id, skill_id: params[:id]).destroy
    #s@interest.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Interest was successfully deleted.' }
      format.json { head :no_content }
    end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:user_id, :skill_id)
    end
end