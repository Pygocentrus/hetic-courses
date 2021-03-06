module Participation::SearchableConcern extend ActiveSupport::Concern

  included do
  end

  module ClassMethods

    def find_contributors(course_id)
      users = []
      Participation.select("*")
      .joins(:user)
      .where("participations.course_id = ? AND participations.role = ?", course_id, "author")
      .each do |participation|
        users << participation.user
      end
      users
    end

    def search_with(options)
      users = []
      Participation.select("*")
      .joins(:user)
      .where("participations.course_id = ? AND participations.user_id = ?", options[:course_id], options[:user_id])
      .each do |participation|
        users << participation.user
      end
      users
    end

    def get_participations(options)
      Participation.select("*")
      .joins(:course)
      .where("participations.role = ? AND participations.user_id = ?", options[:role], options[:user_id])
    end

    def get_participants(options)
      Participation.select('*')
      .distinct
      .joins(:user)
      .where("participations.course_id = ? AND participations.role = 'participant'", options[:course_id])
      .order("first_name ASC")
    end

  end

end
