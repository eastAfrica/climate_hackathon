class Feedback < ApplicationRecord
  belongs_to :early_warning_report, :foreign_key => :report_id
  has_one :user, :foreign_key => "caller_id"
end
