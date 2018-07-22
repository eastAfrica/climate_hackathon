class EarlyWarningForecast < ApplicationRecord
  has_many :forecast_days, inverse_of: :early_warning_forecast
  accepts_nested_attributes_for :forecast_days, reject_if: :all_blank, allow_destroy: true
  belongs_to :district
end
