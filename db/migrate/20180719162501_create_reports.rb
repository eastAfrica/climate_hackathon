class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :weather_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
