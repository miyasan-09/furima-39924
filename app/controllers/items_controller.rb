class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
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
    @item = Item.find(params[:id])
  end

  def edit 
    @item = Item.find(params[:id])
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
      else
        #@item = Item.find(params[:id])
        render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name_item, :details_item, :category_item_id, :status_item_id, :shipping_fee_id, :prefecture_id, :lead_time_id, :price).merge(user_id: current_user.id)
  end
end