class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @cart = current_cart
  end
end
