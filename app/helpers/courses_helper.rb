module CoursesHelper
  def javascript(*files)
    content_for(:foot) { javascript_include_tag(*files) }
  end

  def belongs_to_current_user(course)
    return Course.is_contributor({ course_id: course.id, user_id: current_user.id }) if current_user.present?
    false
  end

  def not_participating(course)
    return Participation.search_with({user_id: current_user.id, course_id: course.id}).count == 0 if current_user.present?
  end
end
