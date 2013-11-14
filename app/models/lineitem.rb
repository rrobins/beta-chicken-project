class Lineitem < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :order

  attr_accessible :price, :quantity
end
