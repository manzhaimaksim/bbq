class EventPolicy < ApplicationPolicy
  def edit?
    user.present? && user == event.user
  end

  def update?
    user.present? && user == event.user
  end

  def destroy?
    user.present? && user == event.user
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

  def event
    record
  end
end
