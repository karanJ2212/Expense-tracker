class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :set_ability

  private

  def set_current_user
    @current_user = current_user
  end

  def set_ability
    @ability = Ability.new(@current_user)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
