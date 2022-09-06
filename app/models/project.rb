class Project < ApplicationRecord
  belongs_to :organization
  has_many :bookings
  has_many_attached :photos

  CATEGORIES = %w[Agriculture Animal\ Rescue Construction Education Environmental Relief\ Effort Sanitation Water\ Access]

  validates :category, inclusion: { in: CATEGORIES }

  include PgSearch::Model
  pg_search_scope :search_by_category,
  against: [ :category ],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :search_by_continent,
  against: [ :continent ],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :search_by_project,
  against: [ :name, :description, :category, :address, :city ],
  using: {
    tsearch: { prefix: true }
  }

end
