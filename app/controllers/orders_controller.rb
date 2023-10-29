class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_ship = OrderShip.new
  end

  def new
    @order_ship = OrderShip.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_ship = OrderShip.new(order_params)

    if @order_ship.valid?
      Payjp.api_key = "sk_test_e87f934563655418e8c11cf8"  
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],
        currency: 'jpy' 
      )
      @order_ship.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_params
    params.require(:item).permit(:image, :name_item, :details_item, :category_item_id, :status_item_id, :shipping_fee_id, :prefecture_id, :lead_time_id, :price).merge(user_id: current_user.id)
  end




end
