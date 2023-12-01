# app/models/activity.rb
class Activity < ApplicationRecord
  belongs_to :club
  has_many :attendance
  has_many :club_advisors
  has_many :staffs, through: :club_advisors
  has_many :staff_activities
  has_many :staff, through: :staff_activities

  after_save :deduct_budget_from_club

  private

  def deduct_budget_from_club
    club = Club.find_by(id: club_id)
    
    if club.present?
      club.budget -= requested_budget 
      club.save
    end
  end

  scope :upcoming_activities, -> {
    where('start_date > ?', Time.current)
      .where('end_date > ?', Time.current)
      .order('start_date ASC')
      .limit(4)
  }
end