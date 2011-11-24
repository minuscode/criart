class AddBoolVisibleCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t| 
      t.change :name, :string
      t.boolean :show
    end
  end
end
