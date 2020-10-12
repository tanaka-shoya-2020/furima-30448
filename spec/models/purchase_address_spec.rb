require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it 'クレジットカード情報と住所の情報が全て揃っているとき' do
        expect(@purchase_address).to be_valid
      end

      it '建物名の情報だけがない時' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'トークンが存在しない時(正しくクレジットカードの情報を記載しなかった時)' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空の時' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフン(-)がついていなかった時' do
        @purchase_address.postal_code = 1_231_234
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号に全角数字が使われていた時' do
        @purchase_address.postal_code = '１００-１０００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空の時' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空の時' do
        @purchase_address.municipality = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空の時' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空の時' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフン(-)がついていた時' do
        @purchase_address.phone_number = '0120-22-1038'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が全角数字で書かれていた時' do
        @purchase_address.phone_number = '１００００１００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
