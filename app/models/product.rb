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
    price_informations.where("period >= ? and period <= ?",
                              start_period, end_period).pluck(:market_price)
  end

end
