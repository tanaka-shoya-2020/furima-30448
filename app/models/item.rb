class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_ship

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name, :image, :description, :category_id, :status_id,
            :delivery_burden_id, :shipping_area_id,
            :days_ship_id, :user, presence: true

  validates :category_id, :status_id, :delivery_burden_id,
            :shipping_area_id, :days_ship_id,
            numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A[0-9]+\Z/ } do
    validates :price, numericality: { greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999 }
  end
end
