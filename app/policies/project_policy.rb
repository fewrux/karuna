class ProjectPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end

    def show?
      return true
    end
  end
end
