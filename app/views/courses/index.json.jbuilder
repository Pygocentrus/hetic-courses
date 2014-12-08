json.array!(@courses) do |course|
  json.extract! course, :id, :title, :date, :location, :duration, :level, :description, :tags, :categorie, :users
  json.url course_url(course, format: :json)
end
