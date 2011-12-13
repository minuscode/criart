ActiveAdmin.register Catalog do
  menu :label => "Catalogos"
  scope :all, :default => true
  index do
    column "Nome", :name
    default_actions
  end
  form :partial => "form"
end
