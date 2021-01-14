class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]

  def index
    @item_order = ItemOrder.new

  end

  def create

    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      Payjp.api_key = "sk_test_b1693adb7f2a038b16ae03f4"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
    
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :shipping_area_id, :city, :address, :phone_number, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end