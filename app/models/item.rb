class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_item
  belongs_to :status_item
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :lead_time

  validates :title, :text, presence: true
  validates :category_item_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_item_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :lead_time_id, numericality: { other_than: 1, message: "can't be blank" }


end
