class EventPolicy < ApplicationPolicy
  def edit?
    update?
  end

  def update?
    # user.present? && user == event.user
    user_is_owner?(@record)
  end

  def destroy?
    update?
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?(event)
    user.present? && (event.try(:user) == user)
  end
end
