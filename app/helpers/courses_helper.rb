module CoursesHelper
  def belongs_to_current_user(course)
    Course.is_contributor({ course_id: course.id, user_id: current_user.id })
  end

  def not_participating(course)
    Participation.search_with({user_id: current_user.id, course_id: course.id}).count == 0
  end
end
