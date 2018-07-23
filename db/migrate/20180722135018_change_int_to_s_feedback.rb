class ChangeIntToSFeedback < ActiveRecord::Migration[5.2]
  def change
      change_column :feedbacks, :caller_id, :string
  end
end
