class Sector < ApplicationRecord
  belongs_to :district
  has_many :early_warning_reports
end
