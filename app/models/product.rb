class Product < ActiveRecord::Base
  validates :name,:price, :presence => true
  has_many :line_items
  belongs_to :category
  has_and_belongs_to_many :properties

  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :photo,
    :styles => {
      :thumb  => "90x90",
      :medium => "210x150",
      :large => "330x230"
    },
    :storage => :s3,
    :bucket => 'criart',
    :path => ":attachment/:id/:style.:extension",
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :default_url => '/unknown.png'

    #attr_accessor :photo_file_name
    #attr_accessor :photo_content_type
    #attr_accessor :photo_file_size
    #attr_accessor :photo_updated_at

  private

  #vai assegurar que quando se apaga um producto que não existe uma linha de encomenda com esse.
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Producto presente numa encomenda.')
      return false
    end
  end
end
