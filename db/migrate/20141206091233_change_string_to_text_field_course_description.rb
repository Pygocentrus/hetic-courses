class ChangeStringToTextFieldCourseDescription < ActiveRecord::Migration
  def change
    change_column :courses, :description, :text
  end
end
