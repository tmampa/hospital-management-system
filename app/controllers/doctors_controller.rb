class DoctorsController < ApplicationController
	layout 'doctor_dashboard'

	def show
		@doctor = Doctor.find(params[:id])
	end

	def dashboard

	end

	def manage_appointments
		@appointments = current_doctor.appointments
	end

	def manage_treatments
		@completed_appointments = current_doctor.appointments.where(status: 'completed')
	end
end