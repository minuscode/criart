class Product < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :category
end
