# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
<<<<<<< HEAD
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
require_relative "array"
=======
>>>>>>> fa1f2fdc648410527068f6712aa57b2abeb4e8ac

puts "Creating categories and products"
Category.destroy_all
Product.destroy_all

categories = [ "Fruit products", "Vegetable products" ]

products = [[ "Apples", "Apricots", "Cherries", "Grapes", "Kiwis", "Lemons",
                   "Melons", "Oranges", "Peaches", "Pears", "Strawberries",
                   "Watermelons" ],
                 [ "Asparagus", "Beans", "Cabbages", "Carrots", "Cauliflowers",
                   "Cucumbers", "Eggplants", "Garlic", "Lettuces", "Mushrooms",
                   "Onions", "Peppers", "Tomatoes Round"]]

categories.each_with_index do |category, index|
  category_new = Category.new(name: category, unit: "100 kg")
  category_new.save!
  products[index].each do |product|
    product_new = Product.new(name: product, category_id: category_new.id)
    product_new.save!
  end
end


puts "Finished!"


puts "Creating Fake Users and Farms"
User.destroy_all
round = 0
100.times do
  user = User.new(
  email:  Faker::Internet.email,
  password: Faker::Internet.password,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  farm_location: city_array_ibge.sample,
  farm_name: Faker::Company.name,
  farm_certification: ["USDA Organic Certification", "Quality Assurance International", "Nature’s International Certification Services",
                       "EU Organic Certification", "IFOAM", "Produto Orgânico do Brasil"].sample,
  farm_size: (1..1000).to_a.sample,
  phone: Faker::PhoneNumber.phone_number,
  bio: Faker::Lorem.paragraphs(3)
  )
  user.save!
  crop = Crop.new(
    user: user,
    harvest_date: rand(Date.civil(2017, 8, 28)..Date.civil(2020, 12, 31)),
    product: Product.all.sample,
    transport: [true, false].sample,
    description: Faker::Lorem.paragraph,
    production: (1..9999).to_a.sample
  )
  crop.save!
  sleep(0.020)
  puts round += 1
end

puts "Finished!"
