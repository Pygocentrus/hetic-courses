class AddUserRolesAndLocation < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :city, :string
  end
end
