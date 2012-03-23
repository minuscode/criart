class CatalogsController < InheritedResources::Base
  def index
    @catalogs = Catalog.page(params[:page]).per(6)
  end
  def show
    @catalog = Catalog.find(params[:id])
    #@products = @catalog.products
    
    filterProds(params, params[:id])
    
    render "products/index"
  end  
end
