class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
    # @review = Review.new
    @reviews = @service.reviews
  end

  # GET /services/new
  def new
    @service = Service.new(user_id: current_user)
  end
  
  # GET /services/1/edit
  def edit
  end






  def create
    # @service = Service.new(service_params)

    if Skill.exists?(name: service_params[:skill_id]) then
      @skill = Skill.find_by(name: service_params[:skill_id])
    else
      @skill = Skill.create(name: service_params[:skill_id]).id
    end

    Service.create(
          user_id: current_user.id, 
          experience: service_params[:experience], 
          description: service_params[:description], 
          price: service_params[:price],
          skill_id: @skill
    )

    #TODO: Add a flash message here

    redirect_to root_path #Make this render to Service.last once the view is setup
  end





  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile
  end

  private
    def service_params
      params.require(:service).permit(:skill_id, :experience, :description, :price, :user_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:user_id, :skill_id, :experience, :description, :price)
    end
end
