class Student < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :tutors, through: :appointments
  #A user cant register the same student name
  validates :name, presence: true, uniqueness: {scope: :user_id}
end
