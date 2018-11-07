class Service < ApplicationRecord
  enum experience: [:newbie, :beginner, :intermediate, :expert, :master]

  belongs_to :user
  belongs_to :skill
  has_many :reviews
  has_many :purchases 

end
