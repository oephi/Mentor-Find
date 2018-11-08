class Review < ApplicationRecord
  belongs_to :user
  belongs_to :service 

  validates :content, presence: true
end
