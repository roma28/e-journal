class AddParentsAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mother_name, :string
    add_column :users, :mother_email, :string
    add_column :users, :mother_job, :string
    add_column :users, :mother_occupation, :string
    add_column :users, :mother_telephone, :string
    add_column :users, :mother_education, :string

    add_column :users, :father_name, :string
    add_column :users, :father_email, :string
    add_column :users, :father_job, :string
    add_column :users, :father_occupation, :string
    add_column :users, :father_telephone, :string
    add_column :users, :father_education, :string
  end
end
