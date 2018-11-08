class Service < ApplicationRecord
  enum experience: [:newbie, :beginner, :intermediate, :expert, :master]

  belongs_to :user
  belongs_to :skill
  has_many :reviews
  has_many :purchases 

    # Validates price to be integer and more than zero
    validates :user_id, :skill_id, :description, :price, presence: true
    validates :price, numericality: { only_integer: true, greater_than: 0,  }
    validates :description, length: { minimum: 50 }
end


