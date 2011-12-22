class CategoriesController < ApplicationController
  
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @cart = current_cart
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @products_all = @category.products.order("name")
    
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
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    @cart = current_cart

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    @cart = current_cart
    
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])
    @cart = current_cart
    

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end
end
