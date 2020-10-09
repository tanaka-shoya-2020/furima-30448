class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #後に編集/削除をする際に使用
  # before_action :move_to_show, only: [:edit,:update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
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

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id,
                                 :delivery_burden_id, :shipping_area_id, :days_ship_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  #後に商品の編集/削除の動作をする際に使用します
  # def move_to_show
  #   @item = Item.find(params[:id])
  #   unless user_signed_in? && current_user == @item.user
  #     redirect_to show
  #   end
  # end
end
