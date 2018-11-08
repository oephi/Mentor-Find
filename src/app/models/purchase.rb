class Purchase < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :service_id, :user_id, :charge_id, :price, presence: true 
end
