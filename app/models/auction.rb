class Auction < ActiveRecord::Base
  belongs_to :product, touch: true
  has_many :bids

  validates :product_id, :price, :started_at, presence: true
end
