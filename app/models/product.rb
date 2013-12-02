class Product < ActiveRecord::Base
	before_destroy :ensure_not_referenced_by_any_line_items
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category

  validates :name, :price, :stock_quantity, presence: true

  attr_accessible :description, :name, :price, :stock_quantity, :category_id, :image

  def ensure_not_referenced_by_any_line_items
  	if line_items.count.zero?
  		return true
  	else
  		errors[:base] << "Line Items present"
  		return false
  	end
  end
end
