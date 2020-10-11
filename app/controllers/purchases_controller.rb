class PurchasesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
      if @purchase_address.valid?
        @purchase_address.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def purchase_params
    #下のコードはpurchase_addressという箱ができていなかったために、引き出すことができず中身を直接引っ張ってくるしかなかった。
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    if @item.purchase
      redirect_to root_path
    end
  end

end
