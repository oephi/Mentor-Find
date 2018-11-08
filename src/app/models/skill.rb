class Skill < ApplicationRecord 
    has_many :services 
    has_many :interests
end
