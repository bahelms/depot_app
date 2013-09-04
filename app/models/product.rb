class Product < ActiveRecord::Base
  has_many :line_items

  validates :description, :image_url, presence: true
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: { 
                        with: /\.(gif|png|jpg)\Z/i,
                        message: 'Valid images are .gif, .jpg, .png' 
  }

  before_destroy :ensure_not_referenced_by_line_items

  def self.latest
    Product.order(:updated_at).last
  end

  private
    # Ensure this product isn't a part of existing line items
    def ensure_not_referenced_by_line_items
      if line_items.empty?
        true
      else
        errors.add(:base, 'Line Items Present')
        false
      end
    end
end
