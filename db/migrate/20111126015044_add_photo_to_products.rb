class AddPhotoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :photo_file_name,    :string
    add_column :products, :photo_content_type, :string
    add_column :products, :photo_file_size,    :integer
    add_column :products, :photo_updated_at,   :datetime
  end
end
