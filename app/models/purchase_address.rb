class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code,
                :prefecture_id, :municipality, :address,
                :building_name, :phone_number, :price, :token

  validates :prefecture_id, presence: true
  validates :municipality,  presence: true
  validates :address,       presence: true
  validates :phone_number,  presence: true

  with_options presence: true do
    validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  validates :token, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,
                   municipality: municipality, address: address, building_name: building_name,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end
