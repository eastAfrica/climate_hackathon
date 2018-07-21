class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy

  def first_question
    questions.first
  end
end
