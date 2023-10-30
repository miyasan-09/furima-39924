class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_ship = OrderShip.new
    if @item.order != nil || current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_ship = OrderShip.new(order_params)

    if @order_ship.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],
        currency: 'jpy' 
      )
      @order_ship.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
