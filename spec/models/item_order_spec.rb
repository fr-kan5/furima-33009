require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end
  
  describe '商品購入機能' do

    context '商品を購入できない場合' do
      it 'postal_codeが空では登録できない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include ("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがなければ登録できない' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include ('Postal code is invalid')
      end
      it 'postal_codeのハイフンの位置が正しくなければ登録できない' do
        @item_order.postal_code = '1234-567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include ('Postal code is invalid')
      end
      it 'postal_codeが全角数字では登録できない' do
        @item_order.postal_code = '１２３-４５６７'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include ('Postal code is invalid')
      end
      it 'shipping_area_idが空では登録できない' do
        @item_order.shipping_area_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが1では登録できない' do
        @item_order.shipping_area_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'cityが空では登録できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上では登録できない' do
        @item_order.phone_number = '123451234512'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンがあると登録できない' do
        @item_order.phone_number = '080-1122-3344'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは半角英数を含むと登録できない' do
        @item_order.phone_number = 'abcde123456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
