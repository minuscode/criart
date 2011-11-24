class CreateProductPropertiesJoinTable < ActiveRecord::Migration
  def change
    create_table :products_properties, :id => false do |t|
      t.integer :product_id
      t.integer :property_id
    end
  end
end

