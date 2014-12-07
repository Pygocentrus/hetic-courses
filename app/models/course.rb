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
  
end
