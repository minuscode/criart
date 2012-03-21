module ProductsHelper
def byProp(products, category)
  if category.blank?
    products
  else
    return products.where(:category_id => category.id)
  end
end
end