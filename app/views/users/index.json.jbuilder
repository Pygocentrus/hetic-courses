json.array!(@users) do |user|
  json.extract! user, :id, :email, :crypted_password, :salt, :user_name, :first_name, :last_name, :birth_date
  json.url user_url(user, format: :json)
end
