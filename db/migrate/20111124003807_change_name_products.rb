class ChangeNameProducts < ActiveRecord::Migration
  def change
    change_table :products do |t| 
      t.change :name, :string
    end
  end
end
