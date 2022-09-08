class Project < ApplicationRecord
  after_create :set_default_image

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
    status_to_check = ['pending', 'accepted', 'declined']
    status_to_check.any? do |status|
      booking_status.include?(status)
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.new(name: self.name)
    @chatroom.project = self
    @chatroom.save!
  end

  def set_default_image
    unless self.photos.empty?
      self.photos.attach(io: File.open(Rails.root.join('app/assets/images/project_default_photo.png')),
      filename: 'project_default_photo.png')
    end
  end
end
