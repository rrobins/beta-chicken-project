class MainController < ApplicationController
  def index
  	@products = Product.order("name").page(params[:page]).per(5)
  	@categories = Category.all
  end

  def category_search
  	@categories = Category.all
  	@products = Product.where("category_id = " + params[:id])
  end

  def show_product
  	@categories = Category.all
  	@product = Product.find(params[:id])
  end

  def search
    # No code is required here.
  end # Automatically loads app/views/store/search.html.erb
  
  def search_results
  	@categories = Category.all
    # Here we will be using the Product model to actually search.
    @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")
  end
end
