class Category < ActiveRecord::Base
	has_many :products

	validates :name, presence: true

  attr_accessible :description, :name
end
