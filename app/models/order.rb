class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, :dependent => :destroy
  scope :complete, where("orders.address IS NOT NULL")
  
  def add_line_items_from_cart(cart)
  cart.line_items.each do |item|
    item.cart_id = nil
    line_items << item
  end
  end
  
  def self.find_with_product(product)
    return [] unless product
    complete.includes(:line_items).
      where(["line_items.product_id = ?", product.id])
  end  
end
