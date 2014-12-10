module Tag::SearchableConcern extend ActiveSupport::Concern

  included do
  end

  module ClassMethods

    def search(query)
      Tag.where("LOWER(tags.name) LIKE LOWER(?)", "%#{query}%")
    end

  end

end
