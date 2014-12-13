json.array!(@courses) do |course|
  json.extract! course, :id, :title, :date, :location, :duration, :level, :description, :tags, :categorie, :users, :slideshare_link, :video_link
  json.url course_url(course, format: :json)
end
