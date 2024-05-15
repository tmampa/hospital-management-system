class Doctor < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :appointments, dependent: :destroy
	has_many :patients, through: :appointments

	def full_name
		"#{first_name} #{last_name}"
	end
end
