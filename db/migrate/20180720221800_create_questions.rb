class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :survey_id, foreign_key: true
      t.integer :body
      t.integer :type

      t.timestamps
    end
  end
end
