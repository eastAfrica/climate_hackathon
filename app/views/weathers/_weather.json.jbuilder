json.extract! weather, :id, :jsonb, :created_at, :updated_at
json.url weather_url(weather, format: :json)
