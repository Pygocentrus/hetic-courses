module Course::Updatable

  def belongs_to_current_user(course)
    if !current_user.nil?
      owners = course.users
      is_owner = false
      owners.each do |owner|
        if owner.id == current_user.id
          is_owner = true
        end
      end
      return is_owner
    else
      false
    end
  end

  def has_right_to_edit
    current_user.role == "Admin" || current_user.role == "Modérateur"
  end

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
