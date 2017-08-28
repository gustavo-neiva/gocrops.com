require 'tealeaves'

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

  def foreceast_next_month
    #create empty array to store all marketprices for forecast gem
    data = []

    # find all priceinfo objects for the product
    all_objects = PriceInformation.where(product_id: self.id)

    # store all marketprices in data array
    all_objects.each do |object|
      data << object.market_price.to_f
    end

    # make forecast for next month

    price = TeaLeaves.forecast(data, 10)

    price = price / 100

    price.round(2)

  end

end
