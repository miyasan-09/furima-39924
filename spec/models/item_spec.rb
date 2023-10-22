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
        end
        it "商品名が無いと出品できない" do
        end
        it "商品の説明が無いと出品できない" do
        end
        it "カテゴリーの情報が無いと出品できない" do
        end
        it "商品の状態の情報が無いと出品できない" do
        end
        it "配送料の負担の情報が無いと出品できない" do
        end
        it "発送元の地域の情報が無いと出品できない" do
        end
        it "発送までの日にちの情報が無いと出品できない" do
        end
        it "価格の情報が無いと出品できない" do
        end
        it "価格は半角数字でないと出品できない" do
        end
        it "" do
        end
        it "" do
        end
        it "" do
        end
        it "" do
        end
        it "" do
        end
        it "" do
        end
        it "" do
        end
        it "" do
        end
      end
    end
end
