class MainController < ApplicationController
  def index
  	@products = Product.order("name")
  	@categories = Category.order("id")
  end

  def category
  	@categories = Category.order("id")
  end

  def show_product
  	@product = Product.find(params[:id])
  end
end
