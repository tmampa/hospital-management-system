class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :treatments, dependent: :destroy

  validate :doctor_is_not_booked, unless: :status_changed?
  validate :date_can_not_be_in_the_past

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

  def date_can_not_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "description", "doctor_id", "id", "id_value", "patient_id", "status", "time", "updated_at"]
  end
end
