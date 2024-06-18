class Rating < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "doctor_id", "id", "id_value", "patient_id", "score", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["doctor", "patient"]
  end
end
