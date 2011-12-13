class CreateProductCatalogs < ActiveRecord::Migration
  def change
    create_table :product_catalogs do |t|
      t.integer :product_id
      t.integer :catalog_id

      t.timestamps
    end
  end
end
