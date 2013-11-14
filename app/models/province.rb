class Province < ActiveRecord::Base
	
  has_many :customer

  attr_accessible :gst, :hst, :name, :pst
end
