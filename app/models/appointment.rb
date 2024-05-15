class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  before_create :default_status

  enum status: %i[pending approved rejected completed]


  private

  def default_status
    self.status ||= 'pending'
  end
end
