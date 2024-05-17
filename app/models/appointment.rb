class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :treatments, dependent: :destroy

  validate :doctor_is_not_booked

  before_create :default_status

  def doctor_is_not_booked
    if Appointment.where(doctor_id: doctor_id, date: date, time: time).exists?
      errors.add(:base, 'Doctor is already booked for this time')
    end
  end


  private

  def default_status
    self.status ||= 'pending'
  end
end
