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

  private
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def new_line_item
      @cart = current_cart
      product = Product.find(params[:product_id])
      @line_item = @cart.line_items.build(:product => product)

      redirect :action => :index

      respond_to do |format|
        if @line_item.save
          format.html { redirect_to(@line_item.cart, :notice => 'Line item was created.')}
          format.xml { render :xml => @line_item, status => :created, :location => @line_item }
        else
          format.html { render :action => "new" }
          format.xml { render :xml => @line_item.errors, :status => :unprocessable_entity }
        end

      end

  end

end
