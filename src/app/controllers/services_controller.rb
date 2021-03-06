class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def new
    @service = Service.new
  end

  def show
    @reviews = @service.reviews
    @review = Review.new
  end
  
  def edit
  end
  
  def create
    @service = current_user.services.new(service_params)
    
    if Skill.where(name: params[:service][:skill]).present?
      @skill = Skill.find_by(name: params[:service][:skill])
    elsif !Skill.where(name: params[:service][:skill]).present? 
      @skill = Skill.create(name: params[:service][:skill])
    end
    
    @service.skill_id = @skill.id
    
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


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
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:user_id, :experience, :description, :price)
    end
end
