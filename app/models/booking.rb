class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :project_id, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    concluded: 3,
    missed: 4
  }
end
