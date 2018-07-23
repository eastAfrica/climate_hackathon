class EarlyWarningReport < ApplicationRecord
  has_one :user, :foreign_key => "reciever_id"
  # has_one :sector, :foreign_key => "sector_id"
  has_one :feedback, :foreign_key => "feedback_id"
  belongs_to :sector, :foreign_key => "sector_id"
end
