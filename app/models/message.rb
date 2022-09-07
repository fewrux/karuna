class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user, optional: true
  belongs_to :organization, optional: true

  def sender?(a_user)
    if user.present?
      user.id == a_user.id
    elsif organization.present?
      organization.id == a_user.id
    end
  end
end
