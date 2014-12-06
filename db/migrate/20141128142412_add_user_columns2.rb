class AddUserColumns2 < ActiveRecord::Migration
  def change
    add_column :users, :batch, :string
    add_column :users, :short_bio, :text
    add_column :users, :avatar, :string
    add_column :users, :personal_link, :string
  end
end
