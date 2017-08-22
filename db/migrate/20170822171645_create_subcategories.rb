class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
