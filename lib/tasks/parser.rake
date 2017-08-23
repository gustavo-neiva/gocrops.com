require "csv"

desc "Parsing historic price information"
task :parse_csv do
  parse_and_save
  puts "Parsing done!"
end



def parse_and_save

  # PriceInformation.destroy_all

  csv_options = { headers: :first_row }
  filepath = File.dirname(__FILE__) + "/market-prices.csv"

  #Select only EU as country
  #ll = CSV.select { |row| row['Country'] == 'EU'}

  CSV.foreach(filepath, encoding: "bom|utf-8", headers: :first_row) do |row|
    next unless row['Country'] == 'EU'
    puts "================="
    puts row

    # Find products where the name matches with the CSV
    product = Product.find_by(name: row['Product desc'])
    puts row['Product desc']

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
