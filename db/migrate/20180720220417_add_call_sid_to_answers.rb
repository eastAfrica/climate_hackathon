class AddCallSidToAnswers  < ActiveRecord::Migration[5.2]
  def change
    add_column :answers :call_sid :string default: ''
    add_index :answers :call_sid
  end
end
