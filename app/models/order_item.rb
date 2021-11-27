class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def self.exist?(user_id, order_id, item_id)
    User.find(user_id).
      orders.find(order_id).
      order_items.find_by(menu_item_id: item_id)
  end
end
