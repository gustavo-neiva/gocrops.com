require 'descriptive_statistics'

class Product < ApplicationRecord
  belongs_to :category
  has_many :crops, dependent: :destroy
  has_many :price_informations, dependent: :destroy

  validates :name, presence: true
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

  # Return a string to set trend__status-- class
  def set_trend_status
    product_prices = self.price_informations.map { |o| o.market_price.to_f }
    product_std = product_prices.standard_deviation / 100
    if self.forecast_next_month > self.current_month + product_std * 0.5
      return "up"
    elsif self.forecast_next_month < self.current_month - product_std * 0.5
      return "down"
    else
      return "stable"
    end
  end

  # Return graph color based on trend status
  def set_graph_status
    product_prices = self.price_informations.map { |o| o.market_price.to_f }
    product_std = product_prices.standard_deviation / 100
    if self.forecast_next_month > self.current_month + product_std * 0.5
      return "#5BE443"
    elsif self.forecast_next_month < self.current_month - product_std * 0.5
      return "#DD4011"
    else
      return "#EDD520"
    end
  end

end
