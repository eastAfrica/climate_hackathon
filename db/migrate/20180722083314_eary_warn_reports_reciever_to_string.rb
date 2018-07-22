class EaryWarnReportsRecieverToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :early_warning_reports, :reciever_id
    add_column :early_warning_reports, :recieviers, :string
  end
end
