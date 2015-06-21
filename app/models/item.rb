class Item < ActiveRecord::Base
  has_many :item_reviews
  validates :name, presence: true
end
