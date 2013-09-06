class CombineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          # Remove all multiple individual items
          cart.line_items.where(product_id: product_id).delete_all

          # Replace with one item of totaled quantity
          item = cart.line_items.build(product_id: product_id, 
                                       quantity: quantity)
          item.save!
        end
      end
    end
  end
end
