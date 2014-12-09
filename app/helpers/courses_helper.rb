module CoursesHelper
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

  def is_moderator?
    if !current_user.nil?
      current_user.role == "Modérateur" || current_user.role == "Admin"
    else
      false
    end
  end

  def is_connected?
    current_user.present?
  end
end
