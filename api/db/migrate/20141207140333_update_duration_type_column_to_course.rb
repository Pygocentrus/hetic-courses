class UpdateDurationTypeColumnToCourse < ActiveRecord::Migration
  def change
    change_column :courses, :duration, :string
  end
end
