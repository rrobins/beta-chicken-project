class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category

  validates :name, :price, :stock_quantity, presence: true

  attr_accessible :description, :name, :price, :stock_quantity, :category_id, :image
end
