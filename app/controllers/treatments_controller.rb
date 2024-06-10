class TreatmentsController < ApplicationController
  def create_treatment
    @appointment = Appointment.find(params[:appointment_id])
    @treatment = @appointment.treatments.build(treatment_params)
    @treatment.doctor_id = @appointment.doctor_id
    @treatment.patient_id = @appointment.patient_id

    if @treatment.save
      redirect_to doctors_treatments_path
    else
      render 'new'
    end
  end 

  private

  def treatment_params
    params.require(:treatment).permit(:prescription, :diagnosis)
  end
end