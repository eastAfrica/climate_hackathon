class ForecastDay < ApplicationRecord
  belongs_to :early_warning_forecast
  has_many :forecast_hours, inverse_of: :forecast_day, dependent: :destroy
  accepts_nested_attributes_for :forecast_hours, reject_if: :all_blank, allow_destroy: true
end
