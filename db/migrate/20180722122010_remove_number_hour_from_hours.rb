class RemoveNumberHourFromHours < ActiveRecord::Migration[5.2]
  def change
    change_column :forecast_hours, :hour, :string
  end
end
