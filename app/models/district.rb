class District < ApplicationRecord
    belongs_to :province
    has_many :sectors
    has_many :early_warning_forecasts
end
