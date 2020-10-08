require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/furima-logo-white.png')
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it '出品画像、商品名、商品説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格がすべて条件を満たす時' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '出品画像が空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end

      it '商品名が空の時' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空の時' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーを空にしたとき' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーを---にした時' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態を空にしたとき' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '商品の状態を---にした時' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it '配送料の負担を空にした時' do
        @item.delivery_burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it '配送料の負担を---にした時' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden must be other than 1")
      end

      it '発送元の地域を空にしたとき' do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送元の地域を---にした時' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it '発送までの日数を空にした時' do
        @item.days_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship can't be blank")
      end

      it '発送までの日数を---にした時' do
        @item.days_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship must be other than 1")
      end

      it '価格を空にした時' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円より安い時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9.999.999円より高い時' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格に全角文字が含まれていた時' do
        @item.price = "４００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end
