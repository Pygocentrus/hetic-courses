class Categorie < ActiveRecord::Base
  has_many :courses

  def as_json(options={})
    super(:only => [:id, :role, :user_id, :course_id])
  end
end
