class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def default_status
    self.status ||= 'pending'
  end
end
