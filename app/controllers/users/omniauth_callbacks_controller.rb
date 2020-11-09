class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_for_omniauth_provider(request.env['omniauth.auth'])
    user_persisted?(request.env['omniauth.auth'])
  end

  def vkontakte
    @user = User.find_for_omniauth_provider(request.env['omniauth.auth'])
    user_persisted?(request.env['omniauth.auth'])
  end

  def user_persisted?(token)
    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: token.provider)
      sign_in_and_redirect @user, event: :authentication
    # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: token.provider,
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end
