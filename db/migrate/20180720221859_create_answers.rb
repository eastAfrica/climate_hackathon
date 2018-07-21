class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_id, foreign_key: true 
      t.integer :source
      t.string :content
      t.string :form

      t.timestamps
    end
  end
end
