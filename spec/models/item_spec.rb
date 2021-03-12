require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

   describe "商品の出品" do
    
    context '商品出品できるとき' do
      it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、
      配送料の負担について、発送元の地域、日数、価格 が存在すれば出品できる' do
      expect(@item).to be_valid
      end
    end
  end


  context '商品出品できないとき' do
    it '商品画像が空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'category_idが1では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態が空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'status_idが1では登録できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it '配送料の負担についてが空では登録できない' do
      @item.fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
    end
    it 'fee_idが1では登録できない' do
      @item.fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee must be other than 1")
    end
    it '発送元の地域が空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1では登録できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送までの日数が空では登録できない' do
      @item.day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'day_idが1では登録できない' do
      @item.day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end
    it '販売価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が299以下では登録できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '販売価格が10,000,000,000以上では登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '販売価格が半角数字でないと登録できない' do
      @item.price = '７７７'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
      
  end
 end

