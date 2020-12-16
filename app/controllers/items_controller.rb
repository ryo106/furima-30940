class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :product_status_id, :shipping_fee_burden_id, :prefectures_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
