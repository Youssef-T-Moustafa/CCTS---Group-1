class ApplicationController < ActionController::Base
    def index
    
    end

    before_action :set_upcoming_activities
    def set_upcoming_activities
        #Currently we will not display activities that are currently onging, since start_date must be after current date.
        #We can change the limits here, it will auto update
      @upcoming_activities = Activity.where("start_date > ? AND end_date > ?", DateTime.now, DateTime.now).order(:start_date).limit(4)
    end

    before_action :set_staff
    def set_staff
        @staffs = Staff.all
        @staffs_by_gender = Staff.group(:gender).count # this will return a hash like {"male" => 10, "female" => 15}
    end
      
    
end
