class CreateSells < ActiveRecord::Migration[5.1]
  def change
    create_table :sells do |t|
      t.date :date
      t.float :quantity
      t.references :crop, foreign_key: true

      t.timestamps
    end
  end
end
