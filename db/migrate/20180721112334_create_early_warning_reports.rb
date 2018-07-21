class CreateEarlyWarningReports < ActiveRecord::Migration[5.2]
  def change
    create_table :early_warning_reports do |t|
      t.integer :early_warning_id
      t.integer :sector_id
      t.string :level
      t.integer :feedback_id
      t.integer :reciever_id

      t.timestamps
    end
  end
end
