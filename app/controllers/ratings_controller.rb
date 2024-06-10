class RatingsController < ApplicationController
	def create
		@rating = Rating.new(rating_params)
		@rating.patient_id = current_patient.id

		if @rating.save
			redirect_to patients_dashboard_path
		else
			flash[:error] = "Something went wrong"
			redirect_to patients_dashboard_path
		end
	end

	private

	def rating_params
		params.require(:rating).permit(:score, :doctor_id)
	end
end
