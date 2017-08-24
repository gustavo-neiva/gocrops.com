class PriceInformation < ApplicationRecord
  belongs_to :product

  validates :product_id, presence: true
  validates :market_price, presence: true, numericality: {greater_than: 0}
  validates :period, presence: true, uniqueness: { scope: :product_id}

end
