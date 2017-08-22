class AddIconToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :icon, :string
  end
end
