class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.category :references
      t.integer :amount
      t.date :harvest_date

      t.timestamps
    end
  end
end
