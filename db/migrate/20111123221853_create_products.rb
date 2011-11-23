class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :reference
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :thumb_url
      t.integer :visits

      t.timestamps
    end
  end
end
