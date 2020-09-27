class EventPolicy < ApplicationPolicy
  def edit?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end

  def show?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
