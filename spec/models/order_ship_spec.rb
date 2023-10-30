require 'rails_helper'
RSpec.describe OrderShip, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_ship).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_ship.building = ''
        expect(@order_ship).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_ship.post_code = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_ship.post_code = '1234567'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_ship.prefecture_id = 1
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityを入力しないと保存できないこと' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("City can't be blank")
      end
      it 'blockを入力しないと保存できないこと' do
        @order_ship.block = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberを入力しないと保存できないこと' do
        @order_ship.phone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが空では登録できないこと' do
        @order_ship.phone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下の場合登録できない' do
        @order_ship.phone_number = '123456789'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
      end 
      it 'phone_numberが12桁以上の場合登録できない' do
        @order_ship.phone_number = '123456789123'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
      end 
      it 'phone_number半角数字以外の文字が含まれている場合登録できない' do
        @order_ship.phone_number = 'あ'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
