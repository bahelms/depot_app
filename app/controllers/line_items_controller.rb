class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:edit, :update, :destroy]

  def create
    @line_item = @cart.add_product(params[:product_id])
    if @line_item.save
      redirect_to store_url
      session[:counter] = nil
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated.'
    else
      render 'edit'
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
