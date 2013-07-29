json.array!(@teams) do |team|
  json.extract! team, :name, :user_id, :coat_of_arms, :money
  json.url team_url(team, format: :json)
end
