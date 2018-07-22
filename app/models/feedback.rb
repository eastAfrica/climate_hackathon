class Feedback < ApplicationRecord
  has_one :user, :foreign_key => "caller_id"
end
