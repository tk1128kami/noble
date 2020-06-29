class CustomersController < ApplicationController


  def index
    @customers = Customer.includes(:items).page(params[:page]).per(15).order("id DESC")
  end

  def new
    @customer = Customer.new
    @item = @customer.items.build
  end

  def create
    Customer.create(customer_params)
  end

  def edit
    @customer = Customer.find(params[:id])
    @CsutomerItems = @customer.items
    @NewItems = Item.new
    @CreatedItems = []
    allitems = Item.all
    allitems.each do |item|
      unless item.customers.where(id: params[:id]).exists?
        @CreatedItems.push(item)
      end
    end
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_update_params)
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def search
    @customers = Customer.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    @customers.includes(:items)
    respond_to do |format|
    format.html
    format.json
    end  
  end

  private
  def customer_params
    params.require(:customer).permit(:name,:name_kana,:nickname,:birthday,:phone,:email,:text, items_attributes: [:name,:price,:image,:text])
  end

  def customer_update_params
    params.require(:customer).permit(:name,:name_kana,:nickname,:birthday,:phone,:email,:text, items_attributes: [:name,:price,:image,:text], item_ids:[])
  end

end
