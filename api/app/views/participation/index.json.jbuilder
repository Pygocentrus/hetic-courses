json.array!(@participations) do |participation|
  json.extract! participation, :id, :role, :user_id, :course_id
  json.url participation_url(participation, format: :json)
end
