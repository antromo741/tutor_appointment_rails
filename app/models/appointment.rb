class Appointment < ApplicationRecord
  belongs_to :tutor
  belongs_to :student
  validates :start_time, :end_time, :location, presence: true
end
