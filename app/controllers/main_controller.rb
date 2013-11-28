class MainController < ApplicationController
  def index
  	@products = Product.order("name")
  end

  def category
  end
end
