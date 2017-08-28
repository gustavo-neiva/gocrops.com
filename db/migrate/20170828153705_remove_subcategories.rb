class RemoveSubcategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :subcategories
  end
end
