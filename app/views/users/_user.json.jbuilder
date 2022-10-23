json.extract! user, :id, :username, :description, :role, :avatar
json.url user_url(user, format: :json)
