class Auction < ActiveRecord::Base
  default_scope { order('started_at ASC') } 

  belongs_to :product, touch: true
  has_many :bids

  validates :product_id, :price, :started_at, presence: true
end
