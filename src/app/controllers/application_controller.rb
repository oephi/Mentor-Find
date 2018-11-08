class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private
  def configure_permitted_parameters #These are the strong parameters for the devise login/signup forms.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city, :phone, :avatar, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :city, :phone, :avatar, :description])
  end
end