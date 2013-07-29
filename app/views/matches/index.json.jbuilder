json.array!(@matches) do |match|
  json.extract! match, :date, :home_team_id, :away_team_id
  json.url match_url(match, format: :json)
end
