class ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(30).order("created_at DESC")
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end
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
  
  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end  
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :text)
  end
end
