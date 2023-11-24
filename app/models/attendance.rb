class Attendance < ApplicationRecord
  # validates_uniqueness_of :student_id, scope: :activity_id

 

  belongs_to :student
  belongs_to :activity
end
