class EarlyWarningReport < ApplicationRecord
  belongs_to :early_warning_forecast, :foreign_key => :early_warning_id
  has_one :user, :foreign_key => "reciever_id"
  has_one :sector, :foreign_key => "sector_id"
  has_one :feedback, :foreign_key => "feedback_id"
end
