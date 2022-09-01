class Booking < ApplicationRecord
  validates :user_id, presence: true
end
