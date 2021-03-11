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
    it '商品の状態が空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '発送元の地域が空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数が空では登録できない' do
      @item.day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it '販売価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が299以下では登録できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '販売価格が10,000,000,000以上では登録できない' do
      @item.price = '10000000'
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

