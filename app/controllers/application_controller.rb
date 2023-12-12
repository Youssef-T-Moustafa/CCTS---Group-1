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

    
    before_action :set_club
    def set_club
        @clubs = Club.all.limit (3)
    end

    before_action :set_activity
    def set_activity
        @activities = Activity.all.limit (3)
    end

    before_action :set_club_member
    def set_club_member
        @club_members = ClubMember.all.limit (3)
    end
    
    before_action :set_attendance
    def set_attendance
        @attendances = Attendance.all.limit (3)
    end

    before_action :set_extra_activity
    def set_extra_activity
        @extra_activities = ExtraActivity.all
    end

    before_action :set_club_advisor
    def set_club_advisor
        @club_advisors = ClubAdvisor.all
    end

    before_action :set_staff_activity
    def set_staff_activity
        @staff_activities = StaffActivity.all
    end

    


#Sign in
def log_in(user)
    if user.is_a?(Student)
        session[:student_id] = user.id
    elsif user.is_a?(Staff)
        session[:staff_id] = user.id
    elsif user.is_a?(Admin)
        session[:admin_id] = user.id
    end
end
  
# Logs out the current user
def log_out
    session.delete(:student_id)
    session.delete(:staff_id)
    session.delete(:admin_id)
    @current_user = nil
end
  
# Returns true if the user is logged in, false otherwise
def logged_in?
    !current_user.nil?
end    

# Define the current_user method
helper_method :current_user
def current_user
    case
    when session[:student_id]
      @current_user = Student.find_by(id: session[:student_id])
    when session[:staff_id]
      @current_user = Staff.find_by(id: session[:staff_id])
    when session[:admin_id]
      @current_user = Admin.find_by(id: session[:admin_id])
    end
end


  
   
    
end
