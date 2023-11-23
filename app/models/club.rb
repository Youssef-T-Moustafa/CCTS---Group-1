class Club < ApplicationRecord
    has_many :staff
    has_many :activities
end