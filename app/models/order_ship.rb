class OrderShip
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token





  with_options presence: true do
    validates :post_code,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_htan: 0, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "is invalid"}
    validates :user_id
    validates :item_id

  end
    
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Ship.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end


end