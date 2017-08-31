class UpdateForeingKeys < ActiveRecord::Migration[5.1]
  def change
    # remove the old foreign_key
     remove_foreign_key :harvests, :crops
     # add the new foreign_key
     add_foreign_key :harvests, :crops, on_delete: :cascade
  end
end
