class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    views_counter
    @products = Product.order(:title)
  end

  private
    def views_counter
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] += 1
      end
    end
end
