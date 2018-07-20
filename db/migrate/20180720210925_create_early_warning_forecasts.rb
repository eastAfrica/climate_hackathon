class CreateEarlyWarningForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :early_warning_forecasts do |t|
      t.integer :district_id

      t.timestamps
    end
  end
end
