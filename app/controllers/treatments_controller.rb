class TreatmentsController < ApplicationController

	def create_treatment
		@appointment = Appointment.find(params[:appointment_id])
		@treatment = Treatment.create(treatment_params)
		redirect_to doctors_treatments_path
	end


	private

	def treatment_params
		params.require(:treatment).permit(:prescription, :appointment_id, :doctor_id, :diagnosis)
	end
end