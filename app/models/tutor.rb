class Tutor < ApplicationRecord
    
    
    validates :name, :phone_number, :specializations, presence: true

end
