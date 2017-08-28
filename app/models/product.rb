class Product < ApplicationRecord
  belongs_to :category
  has_many :crops
  has_many :price_informations

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: { scope: :name}

  def historic_data_array(start_period, end_period)
    price_informations.where("period >= ?::date and period <= ?::date",
                              start_period, end_period).pluck(:period, :market_price)
  end

  def current_month

    # Find correct price information object

    price_current_month = PriceInformation.where("period <= ?::date and product_id = ?",
                                                   Date.today, self.id).order("period ASC").limit(1)      #first.market_price

    # Call first object, get market price, convert to Fixnum and divide by 100 to receive price/kg
    price_current_month.first.market_price.to_f / 100

  end

end
