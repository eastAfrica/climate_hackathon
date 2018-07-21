class Answer < ApplicationRecord
  enum source: { voice: 0, sms: 1 }

  belongs_to :question
  has_one :transcription
end
