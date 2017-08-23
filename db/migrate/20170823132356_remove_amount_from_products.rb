class RemoveAmountFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :amount, :decimal
  end
end
