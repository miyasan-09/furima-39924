class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
        redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def item_params
    params.require(:item).permit(:image, :name_item, :details_item, :category_item_id, :status_item_id, :shipping_fee_id, :prefecture_id, :lead_time_id, :price).merge(user_id: current_user.id)
  end
end