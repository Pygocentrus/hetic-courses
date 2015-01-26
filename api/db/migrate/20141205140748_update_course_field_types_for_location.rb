class UpdateCourseFieldTypesForLocation < ActiveRecord::Migration
  def change
    change_column :courses, :location, :string
    change_column :courses, :level, :string
  end
end
