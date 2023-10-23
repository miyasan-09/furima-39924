require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '商品出品' do
  
      context '出品できる場合' do
        it "条件が揃えば登録できる" do
          expect(@item).to be_valid
        end
      end
      context '出品できない場合' do
        it "商品画像が含まれないと出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名が無いと出品できない" do
          @item.name_item = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name item can't be blank")

        end
        it "商品の説明が無いと出品できない" do
          @item.details_item = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Details item can't be blank")

        end
        it "カテゴリーの情報が無いと出品できない" do
          @item.category_item_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category item can't be blank")

        end
        it "商品の状態の情報が無いと出品できない" do
          @item.status_item_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status item can't be blank")

        end
        it "配送料の負担の情報が無いと出品できない" do
          @item.shipping_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")

        end
        it "発送元の地域の情報が無いと出品できない" do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")

        end
        it "発送までの日にちの情報が無いと出品できない" do
          @item.lead_time_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Lead time can't be blank")

        end
        it "価格の情報が無いと出品できない" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")

        end
        it "価格は半角数字でないと出品できない" do
          @item.price = 'aaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")

        end
        it "価格は300円以上でないと出品できない" do
          @item.price = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")

        end
        it "価格は9,999,999円以下でないと出品できない" do
          @item.price = '10,000,000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")

        end
        it "カテゴリーに「---」が選択されている場合は出品できない" do
          @item.category_item_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category item can't be blank")

        end
        it "商品の状態に「---」が選択されている場合は出品できない" do
          @item.status_item_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Status item can't be blank")

        end
        it "配送料の負担に「---」が選択されている場合は出品できない" do
          @item.shipping_fee_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")

        end
        it "発送元の地域に「---」が選択されている場合は出品できない" do
          @item.prefecture_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")

        end
        it "発送までの日数に「---」が選択されている場合は出品できない" do
          @item.lead_time_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Lead time can't be blank")

        end
        it "userが紐付いていなければ出品できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
        it "" do
        end

      end
    end
end
