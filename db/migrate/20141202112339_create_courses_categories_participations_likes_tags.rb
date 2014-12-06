class CreateCoursesCategoriesParticipationsLikesTags < ActiveRecord::Migration

  def change
    create_table :courses do |t|
      t.string  :title,           :null => false
      t.string  :description,     :null => false
      t.integer :level
      t.integer :location
      t.string  :video_link
      t.string  :slideshare_link
      t.string  :image_link
      t.integer :category_id
      t.integer :user_id
      t.integer :participation_id
      t.integer :tagging_id
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, :null => false
      t.timestamps
    end

    create_table :like do |t|
      t.belongs_to :course
      t.belongs_to :user
      t.timestamps
    end

    # Between course and user (user participate to course - manyToMany)
    create_table :participations do |t|
      t.belongs_to :course
      t.belongs_to :user
      t.date       :date
      t.string     :role
      t.timestamps
    end

    # Between course and tag (course is tagged - manyToMany)
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :course
      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
