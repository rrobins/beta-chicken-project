class MainController < ApplicationController
  def index
  	@products = Product.order("name")
  	@categories = Category.all
  end

  def category_search
  	@categories = Category.all
  	@products = Product.where("category_id = " + params[:id])
  end

  def show_product
  	@product = Product.find(params[:id])
  end
end
