ActiveAdmin.register RangeFilter do
  menu :label => "Limites de Preco"
  index do
    column "Descricao", :description
    column "Valor Minimo", :valueMin
    column "Valor Maximo", :valueMax
  end
end
