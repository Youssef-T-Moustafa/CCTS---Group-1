class Club < ApplicationRecord
    has_many :club_advisors
    has_many :staffs, through: :club_advisors
    has_many :activities
    has_many :club_members
    has_many :students, through: :club_members
end