class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :courses, :through => :taggings

  include Tag::SearchableConcern

  def as_json(options={})
    super(:only => [:id, :name])
  end
end
