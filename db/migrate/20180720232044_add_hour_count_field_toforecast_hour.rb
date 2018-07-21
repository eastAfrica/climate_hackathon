class AddHourCountFieldToforecastHour < ActiveRecord::Migration[5.2]
  def change
    add_column :forecast_hours, :hour, :integer
  end
end
