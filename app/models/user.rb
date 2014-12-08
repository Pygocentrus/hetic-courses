class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :participations
  has_many :courses, :through => :participations

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  def as_json(options={})
    super(:only => [:id, :first_name, :last_name, :user_name, :email])
  end
end
