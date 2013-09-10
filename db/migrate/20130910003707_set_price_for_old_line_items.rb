class SetPriceForOldLineItems < ActiveRecord::Migration
  def change
    LineItem.all.each do |item|
      item.update_attribute(:price, item.product.price) if item.price.nil?
    end
  end
end
