class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :delete_all

  def self.new_order(user_id)
    new_order = Order.create!(user_id: user_id, status: "shopping_cart", total_price: 0)
    new_order
  end

  def self.placed_orders(user_id)
    orders = User.find(user_id).orders.where(status: "delivered").or(User.find(user_id).orders.where(status: "placed"))
  end

  def self.pending_orders?
    orders = Order.where(status: "placed")
  end
end
