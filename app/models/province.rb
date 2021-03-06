class Province < ActiveRecord::Base
	
  has_many :customer

  validates :gst, :pst, :hst, :name, presence: true
  validates :name, uniqueness: true

  attr_accessible :gst, :hst, :name, :pst
end
