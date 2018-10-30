class Service < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :purchases 
  has_many :reviews
end
