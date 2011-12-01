ActiveAdmin.register Product do
  menu :label => "Produtos"

  scope :all, :default => true
  scope :rings do |products|
      products.where("category_id = ?", Category.where('id = 1'))
  end

  scope :bracelets do |products|
    products.where("category_id = ?", Category.where('id = 2'))
  end

  scope :earrings do |products|
    products.where("category_id = ?", Category.where('id = 3'))
  end

  scope :necklaces do |products|
    products.where("category_id = ?", Category.where('id = 4'))
  end

  index :as => :grid do |product|
    menu :label => "Produtos"
    div do
      a :href => admin_product_path(product) do
        image_tag(product.photo.url(:medium))
      end
    end
    a truncate(product.name), :href => admin_product_path(product)
  end

  # Customization of the Products Form page (edit/new)

  form :html => { :enctype => "multipart/form-data" } do |f|
        f.inputs "Base" do
          f.input :name, :label => "Nome"
          f.input :category, :label => "Categoria"
          f.input :price, :label => "Preco"
          f.input :photo, :as => :file, :label => "Foto", :hint => f.template.image_tag(f.object.photo.url(:thumb))
        end
        f.inputs "Content" do
          f.input :reference, :label => "Referencia"
          f.input :description, :label => "Descricao"
        end
        f.buttons
      end

  # Show
  show :title => :name do
    panel "Caracteristicas" do
       attributes_table_for product, :name, :category, :price, :reference, :description
      image_tag(product.photo.url(:medium))
    end
    active_admin_comments
  end


end

=begin
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
=end