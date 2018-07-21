class CreateForecastDays < ActiveRecord::Migration[5.2]
  def change
    create_table :forecast_days do |t|
      t.date :day_of_forecast
      t.belongs_to :early_warning_forecast, foreign_key: true

      t.timestamps
    end
  end
end
