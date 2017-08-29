require 'descriptive_statistics'

class Product < ApplicationRecord
  belongs_to :category
  has_many :crops
  has_many :price_informations

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: { scope: :name}

  def historic_data_array(start_period, end_period)
    start_period = start_period.split("/").join
    end_period = end_period.split("/").join
    price_informations.where("period >= ?::date and period <= ?::date",
                              start_period, end_period).map{|pi| [pi.period, pi.market_price / 100] }
  end

  def current_month

    # Find correct price information object

   self.price_informations.order("period ASC").last.market_price.to_f / 100.00

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

  def choose_css_class
    product_prices = self.price_informations.map { |o| o.market_price.to_f }
    product_std = product_prices.standard_deviation
    if self.forecast_next_month > self.current_month + product_std
      return "up"
    elsif self.forecast_next_month < self.current_month - product_std
      return "down"
    else
      return "stable"
    end
  end

end


