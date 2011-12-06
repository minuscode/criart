class CreateRangeFilters < ActiveRecord::Migration
  def change
    create_table :range_filters do |t|
      t.string :description
      t.decimal :valueMin
      t.decimal :valueMax

      t.timestamps
    end
  end
end
