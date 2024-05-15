class Treatment < ApplicationRecord
  belongs_to :appointment
  belongs_to :doctor
  belongs_to :patient
end
