class AddFieldsToCrops < ActiveRecord::Migration[5.1]
  def change
    add_column :crops, :production, :integer
    add_column :crops, :pictures, :string
    add_column :crops, :transport, :boolean
    add_column :crops, :description, :text
  end
end
