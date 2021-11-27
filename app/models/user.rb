class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  has_secure_password
end
