class EarlyWarnRemoveFeedbackAddStatus < ActiveRecord::Migration[5.2]
  def change
      remove_column :early_warning_reports, :feedback_id
      add_column :early_warning_reports, :sms_status, :string

  end
end
