class ClubAdvisor < ApplicationRecord
  belongs_to :club
  belongs_to :staff
end
