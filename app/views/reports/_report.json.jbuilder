json.extract! report, :id, :weather_id, :user_id, :status, :created_at, :updated_at
json.url report_url(report, format: :json)
