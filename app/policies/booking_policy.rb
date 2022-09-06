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
    user_booking = record.project.bookings.select do |booking|
                      booking.user == user
    end
    user_booking.empty?
  end

  def accept?
    record.project.organization == user
  end

  def decline?
    record.project.organization == user
  end

  def missed?
    record.project.organization == user
  end

  def concluded?
    record.project.organization == user
  end
end
