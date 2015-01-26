module User::SearchableConcern extend ActiveSupport::Concern

  included do
  end

  module ClassMethods

    def find_by_user_name(query)
      user = User.where("LOWER(users.user_name) LIKE LOWER(?)", query).first
      user.present? ? user : nil
    end

    def find_by_slug(query)
      user = User.where("LOWER(users.slug) LIKE LOWER(?)", query).first
      user.present? ? user : nil
    end

  end

end
