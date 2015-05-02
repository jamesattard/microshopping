class Subcategory < ActiveRecord::Base
  belongs_to :category, touch: true
  has_many :products

  validates :name, :category_id, presence: true
end
