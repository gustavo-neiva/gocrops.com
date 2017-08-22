class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :farm_location, :string
    add_column :users, :farm_name, :string
    add_column :users, :farm_certification, :string
    add_column :users, :farm_size, :integer
    add_column :users, :phone, :string
    add_column :users, :bio, :text
    add_column :users, :avatar, :string
    add_column :users, :farm_picture, :string
  end
end
