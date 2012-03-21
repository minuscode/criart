module ApplicationHelper
  def facebook_like (opts={})
    layout = "standard"
    show_faces = "true"
    width = "450"
    if(opts[:count] == "count")
      layout = "button_count"
      show_faces = "false"
      width = "150"
    end
    content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{opts[:url]}&layout=#{layout}&show_faces=#{show_faces}&width=#{width}&action=like&font=arial&colorscheme=light&height=100", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like, :class => opts[:class]
  end  
end
def number_to_currency(number, options = {})
  options[:locale] ||= I18n.locale
  super(number, options)
end
def filterProdsCat(params)
  @category = Category.find(params[:id])
  @products_all = @category.products.order("updated_at")
  
  if(params[:property_id].nil?)
    @p = @category.products.scoped
  else
    @p = @category.products.scoped.bycategory(params[:property_id])
    @properties_chosen = Property.find(:all, :conditions => {:id => params[:property_id].dup.split(",")})
  end
  
  range = params[:range_id]
  
  if(!range.blank?)
      @curr_range = RangeFilter.find(range)
      if !@curr_range.valueMax.nil?
        @products ||= @p.where(:price => @curr_range.valueMin...@curr_range.valueMax)
      else
        @products ||= @p.where("price >= "+ @curr_range.valueMin)
      end
  else
    @products ||= @p
  end
  
  @products = @products.page(params[:page]).per(6)
  @cart = current_cart
  @properties ||= Property.all
  @ranges ||= RangeFilter.all
end

def filterProds(params)
  #@category = Category.find(params[:id])
  @products_all = Product.find(:all, :order => "updated_at")
  
  #@products_all = @category.products.order("name")
  
  if(params[:property_id].nil?)
    @p =  Product
  else
    @p =  Product.bycategory(params[:property_id])
    
    @properties_chosen = Property.find(:all, :conditions => {:id => params[:property_id].dup.split(",")})
  end
  
  range = params[:range_id]
  
  if(!range.blank?)
      @curr_range = RangeFilter.find(range)
      if !@curr_range.valueMax.nil?
        @products ||= @p.where(:price => @curr_range.valueMin...@curr_range.valueMax)
      else
        @products ||= @p.where("price >= "+ @curr_range.valueMin)
      end
  else
    @products ||= @p
  end
  
  @products = @products.page(params[:page]).per(6)
  @cart = current_cart
  @properties ||= Property.all
  
  @ranges ||= RangeFilter.all
end
