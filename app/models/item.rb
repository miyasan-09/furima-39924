class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_item
  belongs_to :status_item
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :lead_time
  

  validates :category_item_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_item_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :lead_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :name_item, presence: true
  validates :image, presence: true
  validates :details_item, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

end
