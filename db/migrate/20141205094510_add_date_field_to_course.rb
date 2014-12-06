class AddDateFieldToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :date, :date
  end
end
