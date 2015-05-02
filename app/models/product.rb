class Product < ActiveRecord::Base
  belongs_to :subcategory, touch: true
  has_many :auctions

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :name, :description, :subcategory_id, presence: true
end
