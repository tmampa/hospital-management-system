# app/controllers/appointments_controller.rb

class AppointmentsController < ApplicationController
  def create_appointment
    @appointment = current_patient.appointments.build(appointment_params)
    if @appointment.save
      redirect_to patients_appointments_path, notice: 'Appointment was successfully created.'
    else
      render patients_dashboard_path
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:description, :date, :time, :doctor_id)
  end
end