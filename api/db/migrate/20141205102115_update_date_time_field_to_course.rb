class UpdateDateTimeFieldToCourse < ActiveRecord::Migration
  def change
    change_column :courses, :date, :datetime
  end
end
