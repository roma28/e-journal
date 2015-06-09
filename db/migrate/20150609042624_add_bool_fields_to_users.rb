class AddBoolFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guardianship, :boolean
    add_column :users, :disability, :boolean
  end
end
