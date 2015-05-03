class Bid < ActiveRecord::Base
  belongs_to :auction, touch: true
  belongs_to :user, touch: true

  validates :user_id, :auction_id, presence: true
end
