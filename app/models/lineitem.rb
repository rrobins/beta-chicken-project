class Lineitem < ActiveRecord::Base 
  belongs_to :product
  belongs_to :order

  validates :price, :quantity, presence: true

  attr_accessible :price, :quantity
end
