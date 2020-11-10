class Student < ApplicationRecord
  belongs_to :user
  #A user cant register the same student name
  validates :name, presence: true, uniqueness: {scope: :user_id}
end
