class Doctor < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :appointments, dependent: :destroy
	has_many :patients, through: :appointments
	has_many :treatments, dependent: :destroy
	has_many :ratings, dependent: :destroy

	def average_rating
		ratings.average(:score).round(2)
	end

	def full_name
		"#{first_name} #{last_name}"
	end
end
