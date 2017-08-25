class Product < ApplicationRecord
  belongs_to :category
  has_many :crops
  has_many :price_informations

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: { scope: :name}

  def add_icon_to_product(product_id)
    product = Product.find(product_id)
    return "images/icons/#{product.name}.svg"
  end

  def historic_data_array(start_period, end_period)
    price_informations.where("period >= ?::date and period <= ?::date",
                              start_period, end_period).pluck(:period, :market_price)
  end

end
