class Rating < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
end
