class User < ApplicationRecord
  has_many :students
  has_many :tutors, through: :students
  has_many :appointments, through: :students
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # validates 
  def self.from_google(uid:, email:, full_name:, avatar_url:)
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
   

  end
end
