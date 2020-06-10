class ApplicationController < ActionController::Base
  # Настройка для работы Девайза, когда юзер правит профиль
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?

  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[name email password]
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[name email password current_password]
    )
  end
end
