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
		ratings.average(:score)
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def self.ransackable_associations(auth_object = nil)
		["appointments", "patients", "ratings", "treatments"]
	end

	def self.ransackable_attributes(auth_object = nil)
		["created_at", "email", "encrypted_password", "first_name", "id", "id_value", "last_name", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "specialization", "updated_at"]
	end
end
