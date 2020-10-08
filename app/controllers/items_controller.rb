class ItemsController < ApplicationController
  def index
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
end
