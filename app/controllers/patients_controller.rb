class PatientsController < ApplicationController
	layout 'patient_dashboard'

	def dashboard
		if params[:search].present?
			@doctors = Doctor.where("first_name LIKE :search OR last_name LIKE :search OR specialization LIKE :search", search: "%#{params[:search]}%")
		else
			@doctors = Doctor.all
		end
	end

	def appointments
		@appointments = current_patient.appointments
	end

	def treatments
		@treatments = current_patient.treatments
	end

	def payments
		@patient = current_patient
		@payments = @patient.payments
	end

	def export_treatments_pdf
  @treatment = Treatment.find(params[:id])

  pdf = Prawn::Document.new
  pdf.text "Treatment", size: 30, style: :bold
  pdf.move_down 20

  pdf.text "Prescription: #{@treatment.prescription}", size: 20
  pdf.move_down 10
  pdf.text "Diagnosis: #{@treatment.diagnosis}", size: 20
  pdf.move_down 10
  payment_status = @treatment.payment.nil? ? 'Not Paid' : 'Paid'
  pdf.text "Payment Status: #{payment_status}", size: 20
  pdf.move_down 20

  send_data pdf.render, filename: 'treatment.pdf', type: 'application/pdf'
end
end