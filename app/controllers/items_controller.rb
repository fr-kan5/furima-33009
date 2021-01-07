class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def message_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
