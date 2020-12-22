require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user_seller = FactoryBot.create(:item)
    @user_buyer = FactoryBot.create(:user)
    @order = FactoryBot.build(:order_address, user_id: @user_buyer.id, item_id: @user_seller.id)
    sleep(1)
  end
  describe '商品購入情報' do
    context 'うまくいく場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it '建物名が抜けていても登録できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context 'うまくいかない場合' do
      it '郵便番号が空だと保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はハイフン無しでは保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号は全角では保存できないこと' do
        @order.postal_code = '１２３４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県選択が、id:1が選択されていた場合、保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市町村が空だと保存できないこと' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '市町村が半角だと保存できないこと' do
        @order.municipality = 'yokohama'
        @order.valid?
        expect(@order.errors.full_messages).to include('Municipality is invalid')
      end
      it '番地が空だと保存できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号が全角だと保存できないこと' do
        @order.phone_number = '１２３４５６７８９１０'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号が11桁以上だと保存できないこと' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number number is not a number')
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @order.phone_number = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number number is not a number')
      end
      it '電話番号が英数混合では保存できないこと' do
        @order.phone_number = '12345ABCdef'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not a number')
      end
      it 'user_idが空だと保存できないこと' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
