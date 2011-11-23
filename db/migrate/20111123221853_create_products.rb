class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :reference
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.string :image_url
      t.string :thumb_url
      t.integer :visits

      t.timestamps
    end
  end
  
  def self.down
    drop_table :products
  end
end
