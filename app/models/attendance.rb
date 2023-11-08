class Attendance < ApplicationRecord
  belongs_to :activity
  belongs_to :student
end
