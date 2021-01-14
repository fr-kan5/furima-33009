class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ }

end
