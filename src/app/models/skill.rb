class Skill < ApplicationRecord 
    has_many :services 
    has_many :interests

    validates :name, presence: true
    
end
