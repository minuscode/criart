class ChangeNameProperties < ActiveRecord::Migration
  def change
    change_table :properties do |t| 
      t.change :name, :string
    end
  end
end
