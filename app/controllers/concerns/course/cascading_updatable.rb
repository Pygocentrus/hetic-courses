module Course::CascadingUpdatable extend ActiveSupport::Concerns

  def clean_taggings
    Tagging.where({course_id:@course.id}).delete_all
  end

  def update_or_add_tags
    params["course"]["tags"].each do |tag|
      unless tag.empty?
        # Search the tag
        tag = Tag.where({name: tag}).first
        # Create it if it hasn't been found
        unless tag.present?
          tag = Tag.create({name: tag})
        end
        # Link the current tag to the course
        @course.taggings.create(:tag => tag) if tag
        tag = nil
      end
    end
  end

end
