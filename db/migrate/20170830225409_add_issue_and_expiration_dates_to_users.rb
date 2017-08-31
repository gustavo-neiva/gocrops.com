class AddIssueAndExpirationDatesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :certificate_issue_date, :string
    add_column :users, :certificate_expiration_date, :string
  end
end
