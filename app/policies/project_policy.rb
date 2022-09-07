class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    return update?
  end

  def update?
    record.organization == user
  end

  def destroy?
    record.organization == user
  end
end
