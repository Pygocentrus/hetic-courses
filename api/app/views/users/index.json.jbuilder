json.array!(@users) do |user|
  json.extract! user, :id, :slug, :email, :user_name, :first_name, :last_name, :participations
  json.url user_url(user, format: :json)
end
