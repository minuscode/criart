class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
