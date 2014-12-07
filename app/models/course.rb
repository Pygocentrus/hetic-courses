class Course < ActiveRecord::Base

  include Course::SearchableConcern

  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :participations
  has_many :users, :through => :participations

  has_many :likes

  belongs_to :categorie

  validates :title, :presence => true
  validates :description, :presence => true
  validates_format_of :duration, with: /\A[5-9][0-9]{0,2}\z/i

end
