class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

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
    redirect_to root_path unless @item.user_id == current_user.id && @item.order.blank?
    binding.pry
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @item.user_id == current_user.id && @item.order.blank?
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :product_status_id, :shipping_fee_burden_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end
end
