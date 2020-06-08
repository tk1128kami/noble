class ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(5).order("created_at DESC")
  end
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :text)
  end
end
