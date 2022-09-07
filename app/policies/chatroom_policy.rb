class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    users_ids = record.project.bookings.map do |booking|
                  booking.user_id
                end
    user_booking = record.project.bookings.find do |booking|
                     booking.user == user
                   end
    (record.project.organization == user) || (users_ids.include?(user.id) && (!user_booking.declined? || !user_booking.missed?))
  end
end
