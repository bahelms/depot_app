class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    # product = Product.find(params[:product_id])
    @line_item = @cart.add_product(params[:product_id])

    respond_to do |format|
      if @line_item.save
        format.html do
          redirect_to @line_item.cart, 
                      notice: 'Line item was successfully created.'
        end
        format.json do
          render action: 'show', status: :created, location: @line_item
        end
        session[:counter] = nil
      else
        format.html { render action: 'new' }
        format.json do
          render json: @line_item.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html do
          redirect_to @line_item, notice: 'Line item was successfully updated.'
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json do
          render json: @line_item.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
