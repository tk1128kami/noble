class CustomersController < ApplicationController

  def index
    @customers = Customer.includes(:items).page(params[:page]).per(15).order("id DESC")
  end

  def new
    @customer = Customer.new
    @items = []
    @items.push(@customer.items.build)
    @ItemsAll = Item.all
  end

  def create
    Customer.create(customer_params)
  end

  def edit
    @customer = Customer.find(params[:id])
    @items = []
    @items.push(@customer.items.build)
    @ItemsAll = Item.all
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_update_params)
  end

  def destroy

  end

  def show
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:name,:name_kana,:nickname,:birthday,:phone,:email,:text, item_ids:[], items_attributes: [:name,:price,:image,:text])
  end

  def customer_update_params
    params.require(:customer).permit(:name,:name_kana,:nickname,:birthday,:phone,:email,:text, item_ids:[], items_attributes: [:name,:price,:image,:text])
  end

  def add_items
  end

end
