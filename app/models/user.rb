class User < ActiveRecord::Base
  validates :first_name, :email, :password, presence: true
  has_secure_password
  validates_uniqueness_of :email
  has_many :orders
end
