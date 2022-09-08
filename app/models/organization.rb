class Organization < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :set_default_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :bookings, through: :projects
  has_many :messages
  has_one_attached :photo

  private

  def set_default_image
    unless self.photo.attached?
      self.photo.attach(io: File.open(Rails.root.join('app/assets/images/org_default_photo.jpg')),
      filename: 'org_default_photo.jpg')
    end
  end
end
