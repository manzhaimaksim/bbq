class ApplicationController < ActionController::Base
  # Настройка для работы Девайза, когда юзер правит профиль
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?

  def current_user_can_edit?(model)
    # Если у модели есть юзер и он залогиненный, пробуем у неё взять .event
    # Если он есть, проверяем его юзера на равенство current_user.
    user_signed_in? && (
      model.user == current_user ||
      (model.try(:event).present? && model.event.user == current_user)
    )
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
