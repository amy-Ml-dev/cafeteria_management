class Order < ActiveRecord::Base
  validates :user_id, presence: true
  has_many :order_items
  belongs_to :user
end
