class Lineitem < ActiveRecord::Base 
  belongs_to :product
  belongs_to :order
  belongs_to :cart

  validates :price, :quantity, presence: true

  attr_accessible :price, :quantity, :cart_id
end
