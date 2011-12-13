class ProductCatalog < ActiveRecord::Base
  belongs_to :product
  belongs_to :catalog
end
