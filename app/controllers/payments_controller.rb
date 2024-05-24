class PaymentsController < ApplicationController
  def new
    @treatment = Treatment.find(params[:treatment_id])
    @payment = Payment.new
  end

  def create
    @treatment = Treatment.find(params[:treatment_id])
    @payment = @treatment.build_payment(payment_params)
    @payment.date = Time.now
    @payment.patient = @treatment.patient

    save_result = @payment.save
    puts "Payment saved: #{save_result}" # Debug line

    unless save_result
      puts "Payment errors: #{@payment.errors.full_messages.join(', ')}" # Debug line
      flash[:error] = @payment.errors.full_messages.join(', ')
      render :new
    else
      redirect_to patients_treatments_path
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :payment_method, :date)
  end
end
