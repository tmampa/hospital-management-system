class Payment < ApplicationRecord
  belongs_to :treatment
  belongs_to :patient


  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "date", "id", "id_value", "patient_id", "payment_method", "treatment_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["patient", "treatment"]
  end

end
