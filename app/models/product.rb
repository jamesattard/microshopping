class Product < ActiveRecord::Base
  belongs_to :subcategory, touch: true
  has_many :auctions

  validates :name, :description, :subcategory_id, presence: true
end
