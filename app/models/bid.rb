class Bid < ActiveRecord::Base
  belongs_to :auction

  validates :user_id, :auction_id, presence: true
end
