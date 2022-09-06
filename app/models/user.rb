class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :projects, through: :bookings
<<<<<<< HEAD
  has_many :messages
=======
  has_one_attached :photo
>>>>>>> master

  def full_name
    "#{first_name} #{last_name}"
  end
end
