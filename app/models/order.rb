class Order < ApplicationRecord

  belongs_to :user
  has_one :ship
  belongs_to :item
end
