class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :courses, :through => :taggings

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
