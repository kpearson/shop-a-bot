class ItemReview < ActiveRecord::Base
  belongs_to :item
  validates :item, presence: true
  validates :title, :body,  presence: true
end
