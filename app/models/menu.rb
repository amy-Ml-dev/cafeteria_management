class Menu < ActiveRecord::Base
  validates :name, presence: true
  has_many :menu_items, dependent: :destroy

  def self.active
    all.where(active: true)
  end
end
