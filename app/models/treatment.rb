class Treatment < ApplicationRecord
  belongs_to :appointment
  belongs_to :doctor
  belongs_to :patient
  has_one :payment, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["appointment_id", "created_at", "diagnosis", "doctor_id", "id", "id_value", "patient_id", "prescription", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["appointment", "doctor", "patient", "payment"]
  end
end
