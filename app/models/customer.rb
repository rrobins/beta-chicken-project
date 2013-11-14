class Customer < ActiveRecord::Base

  belongs_to :province
  has_many :order

  attr_accessible :address, :city, :country, :email, :first_name, :last_name, :postal_code
end
