class Catalog < ActiveRecord::Base
  attr_accessible :name, :product_ids
  has_many :product_catalogs
  has_many :products, :through => :product_catalogs
end
