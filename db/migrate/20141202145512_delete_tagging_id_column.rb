class DeleteTaggingIdColumn < ActiveRecord::Migration
  def change
    remove_column :courses, :tagging_id
  end
end
