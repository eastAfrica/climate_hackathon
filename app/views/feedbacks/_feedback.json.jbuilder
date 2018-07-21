json.extract! feedback, :id, :caller_id, :report_id, :audio_url, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
