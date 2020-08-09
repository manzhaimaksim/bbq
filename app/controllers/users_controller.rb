class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  # Задаем объект @user для шаблонов и экшенов
  before_action :set_current_user, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('.success')
    else
      render :edit
    end
  end

  def unsubscribe
    user = User.find_by_unsubscribe_hash(params[:unsubscribe_hash])

    case params[:subscription]
      when "comment_created"
        @reason = "new comments"
        user.update(notify_when_comment_created: false)
      when "subscription_added"
        @reason = "new subscriptions"
        user.update(notify_when_subscription_added: false)
      when "photo_added"
        @reason = "new photos"
        user.update(notify_when_photo_added: false)
    end
  end


  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar)
  end
end
