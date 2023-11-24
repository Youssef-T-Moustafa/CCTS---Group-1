# app/models/activity.rb
class Activity < ApplicationRecord
  belongs_to :club
  has_many :attendance

  after_save :deduct_budget_from_club

  private

  def deduct_budget_from_club
    club = Club.find_by(id: club_id)
    
    if club.present?
      club.budget -= allocated_budget
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



