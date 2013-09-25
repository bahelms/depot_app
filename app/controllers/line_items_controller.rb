class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy, :update]
  before_action :set_line_item, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def create
    @line_item = @cart.add_product(params[:product_id])
    if @line_item.save
      respond_with(@line_item) do |format|
        format.html { redirect_to store_url }
        format.js { @current_item = @line_item }
      end
    end
  end

  def update
    if @line_item.quantity == 1
      @item_id = @line_item.id
      @line_item.destroy
    else
      @line_item.update_attribute(:quantity, @line_item.quantity - 1)
    end

    respond_with(@line_item) do |format|
      format.html { redirect_to @cart }
      format.js 
    end
  end

  def destroy
    @line_item.destroy
    redirect_to @cart, notice: "Item removed from cart"
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
