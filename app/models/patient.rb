class Patient < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :appointments, dependent: :destroy
	has_many :doctors, through: :appointments
	has_many :treatments, dependent: :destroy
	has_many :payments, through: :treatments
	has_many :ratings, dependent: :destroy

	def full_name
		"#{first_name} #{last_name}"
	end

	def self.ransackable_attributes(auth_object = nil)
		["address", "created_at", "email", "encrypted_password", "first_name", "gender", "id", "id_value", "last_name", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
	end

	def self.ransackable_associations(auth_object = nil)
		["appointments", "doctors", "payments", "ratings", "treatments"]
	end
end
