require 'descriptive_statistics'

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

   self.price_informations.order("period ASC").last.market_price.to_f / 100.00

  end

  def foreceast_next_month
    #create empty array to store all marketprices for forecast gem
    data = []

    # find all priceinfo objects for the product
    all_objects = self.price_informations

    # store all marketprices in data array
    all_objects.each do |object|
      data << object.market_price.to_f
    end

    # make forecast for next month

    if data.size > 15
      price = TeaLeaves.forecast(data, 10)
    else
      price = TeaLeaves.forecast(data, 6)
    end

    price = price / 100

    price.round(2)

  end

  def forecast_next_month
    self.forecast_time_series(period: 12)
  end


  #12
  def forecast_time_series(options = {})

    res = []
    pointer = options[:pointer] || 0
    period  = options[:period]  || 12
    data    = self.price_informations.order("period DESC").map { |o| o.market_price.to_f }

    res[period] = data.slice(pointer, period)
    res = res.compact.flatten!

    #unless res.size.zero?
    #  res =forecast_time_series({pointer: pointer + period, period: period})
    #end

    return (res.mean / 100).round(2).to_f
  end

end


