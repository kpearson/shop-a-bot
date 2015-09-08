class ItemsController < ApplicationController
  # before_action :authorize, except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'item was successfully created.'
      redirect_to(@item)
    else
      render "new"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update_attributes(item_params)
        format.html { redirect_to(items_path) }
        format.json { respond_with_bip(@item) }
      else
        format.html { redirect_to items_path }
        format.json { respond_with_bip(@item) }
      end
    end
  end

  # def update
  #   item = Item.find(params[:id])
  #   if item.update(item_params)
  #     flash[:notice] = "Success."
  #     redirect_to item_path(item)
  #   else
  #     render "edit", notice: "Somthing went wrong!"
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end

