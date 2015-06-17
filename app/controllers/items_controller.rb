class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "Success."
      redirect_to item_path(item)
    else
      render edit_item_path(item), notice: "Somthing went wrong!"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
