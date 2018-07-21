json.extract! forecast_day, :id, :day_of_forecast, :early_warning_forecast_id, :created_at, :updated_at
json.url forecast_day_url(forecast_day, format: :json)
