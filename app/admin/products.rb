ActiveAdmin.register Product do
  #scope :unreleased
    index do
      column "Nome do Producto", :name
      column "Categoria", :category
      column "Criado em", :created_at
      column "Visitas", :visits
      column :price, :sortable => :price do |product|
        div :class => "price" do
          number_to_currency product.price
        end
      end
      column "Encomendas" do |p|
           Order.find_with_product(p).count
      end
      default_actions
    end
end
