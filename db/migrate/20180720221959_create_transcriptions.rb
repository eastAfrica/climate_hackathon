class CreateTranscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :transcriptions do |t|
      t.integer :answer_id
      t.string :text

      t.timestamps
    end
  end
end
