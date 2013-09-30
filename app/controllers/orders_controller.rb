class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from @cart

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to store_url, notice: "Thank you for your order!"
    else
      render 'new'
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
