class Service < ApplicationRecord
  enum experience: [:newbie, :beginner, :intermediate, :expert, :master]

  belongs_to :user
  belongs_to :skill
  has_many :purchases 
  has_many :reviews
end
