class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to root_path
    else
      @items = Item.includes(:user)
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def show
  end

  def edit 
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
      else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
   if current_user.id == @item.user.id
     @item.destroy
   end
     redirect_to root_path
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name_item, :details_item, :category_item_id, :status_item_id, :shipping_fee_id, :prefecture_id, :lead_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end