ActiveAdmin.register Product do
  menu :label => "Produtos"

  scope :all, :default => true

  Category.all.each do |category|
    scope category.name.to_sym do |products|
      products.where("category_id = ?", Category.where('id = ' + category.id.to_s))
    end
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
          f.input :properties, :label => "Propriedades"
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