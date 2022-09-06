class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def create?
    true
  end

  def accept?
    true
  end

  def decline?
    true
  end

  def missed?
    true
  end

  def concluded?
    true
  end
end
