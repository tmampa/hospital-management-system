class PatientsController < ApplicationController
  layout 'patient_dashboard'

  def dashboard
    @doctors = Doctor.all
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