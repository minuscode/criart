module ProductsHelper
def byProp(products, category)
  if @feature
    products = products.featured
  end
  
  if category.blank?
    products
  else
    products.where(:category_id => category.id)
  end  
end
end