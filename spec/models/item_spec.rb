require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品情報' do
    it '全ての商品出品情報が正しく入力されている場合、登録できること' do
      expect(@item).to be_valid
    end
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が必須であること' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end
    it '商品の説明が必須であること' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
    end
    it '商品の状態が必須であること' do
      @item.product_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Product status select'
    end
    it '商品の状態が、id:1が選択されていた場合、保存できないこと' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Product status select'
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category select'
    end
    it 'カテゴリーの情報が、id:1が選択されていた場合、保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category select'
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_fee_burden_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Shipping fee burden select'
    end
    it '配送料の負担についての情報が、id:1が選択されていた場合、保存できないこと' do
      @item.shipping_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Shipping fee burden select'
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Prefecture select'
    end
    it '発送元の地域についての情報が、id:1が選択されていた場合、保存できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Prefecture select'
    end
    it '発送までの日数についての情報が必須であること' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delivery day select'
    end
    it '発送までの日数についての情報が、id:1が選択されていた場合、保存できないこと' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delivery day select'
    end
    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '５０００'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it '販売価格は半角英数混合では保存できないこと' do
      @item.price = 'test123'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it '販売価格は半角英語では保存できないこと' do
      @item.price = 'test'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
  end
end

# idの1が選択されていた場合、保存できないことを確認するテストコード
