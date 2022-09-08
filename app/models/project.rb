class Project < ApplicationRecord
  belongs_to :organization
  has_many :bookings
  has_one :chatroom
  after_create :set_chatroom
  has_many_attached :photos

  CATEGORIES = %w[Agriculture Animal\ Rescue Construction Education Environmental Relief\ Effort Sanitation Water\ Access]

  validates :category, inclusion: { in: CATEGORIES }
  validates :available_spots, numericality: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_category,
                  against: [:category],
                  using: {
                  tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_continent,
                  against: [:continent],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_project,
  against: [ :name, :description, :category, :address, :city ],
  using: {
    tsearch: { prefix: true }
  }

  def booking_status
    bookings_status = self.bookings.map do |booking|
                        booking.status
                      end
    bookings_status.include?('accepted')
  end

  private

  def set_chatroom
    @chatroom = Chatroom.new(name: self.name)
    @chatroom.project = self
    @chatroom.save!
  end
end
