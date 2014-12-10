class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :participations
  has_many :courses, :through => :participations

  validates :password, length: { minimum: 3 }, :on => :create
  validates :password, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create

  validates :email, uniqueness: true
  validates :user_name, uniqueness: true
  validates :slug, uniqueness: true

  include User::SearchableConcern

  def as_json(options={})
    super(:only => [:id, :first_name, :last_name, :user_name, :email])
  end
end
