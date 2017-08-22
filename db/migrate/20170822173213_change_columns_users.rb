class ChangeColumnsUsers < ActiveRecord::Migration[5.1]
    change_column :users, :farm_size, :float
end
