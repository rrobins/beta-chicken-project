class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, :through => :line_items
  belongs_to :customer

  attr_accessible :gst_rate, :hst_rate, :pst_rate, :status
end
