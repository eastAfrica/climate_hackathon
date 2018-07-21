class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :caller_id
      t.integer :report_id
      t.string :audio_url

      t.timestamps
    end
  end
end
