class User < ApplicationRecord
  has_many :students
  has_many :tutors, through: :students
  has_many :appointments, through: :students
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
