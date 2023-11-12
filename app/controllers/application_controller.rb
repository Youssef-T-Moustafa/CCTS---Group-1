class ApplicationController < ActionController::Base
    def index
    
    end

    before_action :set_upcoming_activities
    def set_upcoming_activities
        #Currently we will not display activities that are currently onging, since start_date must be after current date.
        #We can change the limits here, it will auto update
      @upcoming_activities = Activity.where("start_date > ? AND end_date > ?", DateTime.now, DateTime.now).order(:start_date).limit(4)
    end
end
