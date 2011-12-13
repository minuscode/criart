class AddFeaturedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :feature, :boolean
  end
end
