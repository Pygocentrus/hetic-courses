module Course::SearchableConcern extend ActiveSupport::Concern

  included do
  end

  module ClassMethods

    def find_by_categorie_id(categorie_id)
      Course.select("courses.title, courses.slug, courses.id, courses.date, courses.level, users.first_name, users.last_name")
      .joins(:categorie)
      .joins(:participations)
      .joins(:users)
      .where("categories.id = ?", categorie_id)
    end

    def find_by_categorie_name(categorie_name)
      Course.select("catgories.name, categories.id, sum(categories.name) as somme")
      .joins(:categorie)
      .where("categories.name = ?", categorie_name)
      .group("categories.name, categories.id")
    end

    def categories_count
      Course.group(:categorie_id).count()
    end

    def find_by_tag_id(tag_id)
      Course.select("courses.title, courses.slug, courses.id, courses.date, courses.level, users.first_name, users.last_name")
      .joins(:taggings)
      .joins(:participations)
      .joins(:users)
      .where("taggings.tag_id = " + tag_id.to_s)
    end

    def find_by_tag_name(tag)
      Course.select("courses.title, courses.slug, courses.date, courses.id")
      .distinct
      .joins(:taggings)
      .joins(:tags)
      .where("tags.name = ?", tag)
    end

    def last_ones(offset, limit)
      Course.where("date >= ?", Time.now)
      .offset(offset)
      .limit(limit)
      .order("date")
    end

    def search_by_title(query)
      Course.where("LOWER(courses.title) LIKE LOWER(?)", "%#{query}%")
    end

    def find_by_slug(query)
      course = Course.where("LOWER(courses.slug) LIKE LOWER(?)", query).first
      course.present? ? course : nil
    end

    def is_contributor(options)
      Participation.select("*")
      .joins(:user)
      .where("participations.course_id = ? AND participations.user_id = ? AND participations.role = 'author'", options[:course_id], options[:user_id])
      .count > 0
    end

    # Searches the courses according
    # to the courses' categories and tags
    def search_by_strings(options)
      if options[:categorie].present?
        if options[:tag].present?
          # Search by Categorie AND Tag
          return Course.select("courses.title, courses.slug, courses.date, courses.id")
          .distinct
          .joins(:taggings)
          .joins(:tags)
          .joins(:categorie)
          .where("tags.name = ? AND categories.name = ?", options[:tag].to_s, options[:categorie].to_s)
        else
          # Search by Categorie
          return Course.select("*")
          .joins(:categorie)
          .where("categories.name = ?", options[:categorie].to_s)
        end
      end
      if options[:tag].present?
        # Search by Tag
        return Course.select("courses.title, courses.slug, courses.date, courses.id")
        .distinct
        .joins(:taggings)
        .joins(:tags)
        .where("tags.name = ?", options[:tag].to_s)
      end
      nil
    end

    def search_by_ids(options)
      if options[:categorie].present?
        if options[:tag].present?
          return Course.select("*")
          .joins(:taggings)
          .where("taggings.tag_id = ? AND courses.categorie_id = ?", options[:tag].to_s, options[:categorie].to_s)
        else
          return Course.where({ :categorie => options[:categorie].to_s })
        end
      end
      if options[:tag].present?
        return Course.select("*")
        .joins(:taggings)
        .where("taggings.tag_id = " + options[:tag].to_s)
      end
      nil
    end

  end

end
