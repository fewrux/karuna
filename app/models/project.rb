class Project < ApplicationRecord
  belongs_to :organization
  has_many :bookings

  CATEGORIES = %w[Agriculture Animal\ Rescue Construction Education Environmental Relief\ Effort Sanitation Water\ Access]

  validates :category, inclusion: { in: CATEGORIES }
end
