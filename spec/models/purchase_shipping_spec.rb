require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping,user_id: user.id,item_id: item.id)
    sleep 0.1
  end

  describe '配送先登録' do
    context '配送先登録できるとき' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が存在すれば出品できる' do
        expect(@purchase_shipping).to be_valid
      end
    end


    context '配送先登録できるとき' do
      it '郵便番号が空では登録できない' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が空では登録できない' do
        @purchase_shipping.prefecture_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では登録できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が空では登録できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      
    end
  end

end
