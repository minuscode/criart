class Product < ActiveRecord::Base
  validates :name,:price, :presence => true
  has_many :line_items
  belongs_to :category
  has_and_belongs_to_many :properties
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
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
