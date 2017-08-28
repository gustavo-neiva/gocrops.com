require "csv"
require "open-uri"

desc "Parsing historic price information"
task :parse_csv do
  parse_and_save
  puts "Parsing done!"
end

desc "Parsing historic price information"
task :parse_by_hand do
  parse_and_save_by_hand
  puts "Parsing by hand done!"
end



def parse_and_save_by_hand
  csv_options = { headers: :first_row }
  url = "https://ec.europa.eu/agriculture/sites/agriculture/files/markets-and-prices/price-monitoring/market-prices-all-products_en.csv"
  download = open(url)
  IO.copy_stream(download, 'test.csv')

  CSV.foreach(download, encoding: "iso-8859-1:utf-8", headers: :first_row) do |row|
    #Select only EU as country
    next unless row['Country'] == 'EU'

    # Find products where the name matches with the CSV
    product = Product.find_by(name: row['Product desc'])

    if product.present?

      # set marketprice, transform to int
      market_price = row['MP Market Price'].to_i
      # create an actual date, as table only provides YYYYMM
      mm_yyyy = [row['Period'][0..3], row['Period'][4..5]]

      period = Date.new( mm_yyyy[0].to_i,  mm_yyyy[1].to_i, 1)

      # check if entry for this product/period combination already exists, if yes,
      # skip, else produce new entry

      next if PriceInformation.find_by(period: period, product_id: product.id)


      price_info_new = PriceInformation.new(product_id: product.id,
                                            market_price: market_price,
                                            period: period)
      price_info_new.save!

    end
  end
end

def parse_and_save

  if Date.today.mday == 13
    parse_and_save_by_hand
  else
    puts "Not today!"
  end
end
