class PatientsController < ApplicationController
  layout 'patient_dashboard'

  def dashboard
  if params[:search].present?
    @doctors = Doctor.where("first_name || ' ' || last_name LIKE ?", "%#{params[:search]}%")
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
end