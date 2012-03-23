module ProductsHelper
def byProp(products, category, property)
  prod = products
  if @feature
    products = products.featured
  end
  
  if category.blank?
    if @catalog.nil?
      products
    else
      @catalog.products.scoped.find(:all, :conditions => ["products_properties.property_id = ?", property.id], :joins => {:properties =>{}})
    end
  else
      products.where(:category_id => category.id)
  end  
end
end
