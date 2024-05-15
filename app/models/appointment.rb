class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :treatments, dependent: :destroy

  before_create :default_status

  private

  def default_status
    self.status ||= 'pending'
  end
end