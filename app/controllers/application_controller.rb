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


#Sign in
def log_in(user)
    if user.is_a?(Student)
        session[:student_id] = user.id
    elsif user.is_a?(Staff)
        session[:staff_id] = user.id
    end
end
  
# Logs out the current user
def log_out
    session.delete(:student_id)
    session.delete(:staff_id)
    @current_user = nil
end
  
# Returns true if the user is logged in, false otherwise
def logged_in?
    !current_user.nil?
end    

# Define the current_user method
helper_method :current_user
def current_user
    @current_user ||= Student.find_by(id: session[:student_id]) || Staff.find_by(id: session[:staff_id])
end

   
    
end
