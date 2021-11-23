class Order < ActiveRecord::Base
  has_many :order_items, dependent: :delete_all
  belongs_to :user

  validates :user_id, presence: true

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

  def self.delivered(yes)
    if yes
      where("delivered_at <= ?", DateTime.now + 1)
    else
      where(delivered_at: nil)
    end
  end
end
