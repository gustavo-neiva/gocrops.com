class CreatePriceInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :price_informations do |t|
      t.references :product, foreign_key: true
      t.decimal :market_price
      t.date :period

      t.timestamps
    end
  end
end
