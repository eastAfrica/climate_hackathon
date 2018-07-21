json.extract! early_warning_report, :id, :early_warning_id, :sector_id, :level, :feedback_id, :reciever_id, :created_at, :updated_at
json.url early_warning_report_url(early_warning_report, format: :json)
