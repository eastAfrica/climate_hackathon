class RemoveReportIdFeedback < ActiveRecord::Migration[5.2]
  def change
    remove_column :feedbacks, :report_id
  end
end
