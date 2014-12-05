class FixTaggingColumnNameInCourse < ActiveRecord::Migration
  def change
    rename_column :courses, :tag_id, :tagging_id
  end
end
