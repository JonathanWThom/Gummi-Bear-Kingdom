class Product < ActiveRecord::Base
  validates :name, :cost, :country, :image, :presence => true
end
