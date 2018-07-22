json.extract! forecast_hour, :id, :disruption_level, :probability_of_occurence, :forecast_day_id, :created_at, :updated_at
json.url forecast_hour_url(forecast_hour, format: :json)
