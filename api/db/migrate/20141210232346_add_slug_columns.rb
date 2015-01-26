class AddSlugColumns < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, unique: true
    add_column :courses, :slug, :string, unique: true
  end
end
