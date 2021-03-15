class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :phone_number, :purchases, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save

    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, purchase_id: purchase.id)
  end

end

