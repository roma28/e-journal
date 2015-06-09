class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passport, :string
    add_column :users, :place_of_birth, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :snils, :string
    add_column :users, :inn, :string
    add_column :users, :adress, :string
    add_column :users, :telephone, :string
    add_column :users, :email, :string
  end
end
