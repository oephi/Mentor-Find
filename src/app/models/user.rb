class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :interests 
  has_many :reviews
  has_many :services 
  has_many :purchases
  has_many :skills, through: :interests 

  # validates :phone, length: {maximum: 10}
  # validates :name, :city, :phone, presence: true #add validates to non-default devise attributes 

  mount_uploader :avatar, AvatarUploader

  # Creates stripe customer_id at registration 
  after_create_commit :add_customer_id
  
  def add_customer_id
    if self.customer_id.nil?
      customer = Stripe::Customer.create(
        :email => self.email
        )

      self.customer_id = customer.id
      self.save
    end
  end
end
