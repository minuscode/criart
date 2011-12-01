class LineItemsController < ApplicationController
  
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])
        @cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new
        @cart = current_cart

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
      @cart = current_cart
      product = Product.find(params[:product_id])
      @line_item = @cart.add_product(product.id)

       respond_to do |format|

         if @line_item.save
         #  format.html { redirect_to(line_item_path(@line_item)) }
           format.js
          # format.json { render json: @line_item,
        #     status: :created, location: @line_item }
         else
           format.html { render action: "new" }
           format.json { render json: @line_item.errors,
             status: :unprocessable_entity }
         end
       end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id]) 
    @cart_curr = @line_item.cart
    
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
    else
      @line_item.destroy
    end

    respond_to do |format|
      format.html { redirect_to @cart_curr}
      format.json { head :ok }
    end
  end
end
