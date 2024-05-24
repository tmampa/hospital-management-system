class Patient < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :appointments, dependent: :destroy
	has_many :doctors, through: :appointments
	has_many :treatments, dependent: :destroy
	has_many :payments, through: :treatments

	def full_name
		"#{first_name} #{last_name}"
	end
end
