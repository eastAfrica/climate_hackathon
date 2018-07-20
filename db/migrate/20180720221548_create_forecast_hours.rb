class CreateForecastHours < ActiveRecord::Migration[5.2]
  def change
    create_table :forecast_hours do |t|
      t.string :disruption_level
      t.string :probability_of_occurence
      t.belongs_to :forecast_day, foreign_key: true

      t.timestamps
    end
  end
end
