class AppointmentsController < ApplicationController
  def create_appointment
    @appointment = current_patient.appointments.build(appointment_params)
    if @appointment.save
      redirect_to patients_appointments_path, notice: 'Appointment was successfully created.'
    else
      logger.error @appointment.errors.full_messages.join(', ')
      redirect_to patients_appointments_path, alert: @appointment.errors.full_messages.join(', ')
    end
  end

  def update_status
    @appointment = Appointment.find(params[:id])
    if @appointment.update(status: params[:status])
      redirect_to doctors_appointments_path, notice: 'Appointment status was successfully updated.'
    else
      redirect_to doctors_appointments_path, alert: 'Failed to update appointment status.'
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:description, :date, :time, :doctor_id, :status)
  end

  # def appointment_params
  #   params.require(:appointment).permit(:description, :date, :time, :doctor_id, :status)
  # end
end
