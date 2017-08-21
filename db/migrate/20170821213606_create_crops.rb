class CreateCrops < ActiveRecord::Migration[5.1]
  def change
    create_table :crops do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.date :harvest_date

      t.timestamps
    end
  end
end
