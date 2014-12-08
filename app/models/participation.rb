class Participation < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  def as_json(options={})
    super(:only => [:role],
      :include => {
        :course => {:only => [:id, :title, :date, :location, :duration, :level, :description, :tags, :categorie]}
      }
    )
  end
end
