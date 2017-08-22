class ChangeColumnsCrops < ActiveRecord::Migration[5.1]
    change_column :crops, :production, :float
end
