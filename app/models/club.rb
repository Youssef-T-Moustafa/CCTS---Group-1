class Club < ApplicationRecord
    belongs_to :staff
    has_many :activities
end