class Product < ActiveRecord::Base
  validates :description, :image_url, presence: true
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: { 
                        with: /\.(gif|png|jpg)\Z/i,
                        message: 'Valid images are .gif, .jpg, .png' 
  }
end
