class ChangeReferenceToTableUser < ActiveRecord::Migration
  def change
    change_table :orders do |t| 
      t.references :users
    end
  end
end