class MenuItem < ActiveRecord::Base
  validates :menu_id, presence: true
  validates :menu_item_name, presence: true
  validates :menu_item_price, presence: true
  belongs_to :menu
end
