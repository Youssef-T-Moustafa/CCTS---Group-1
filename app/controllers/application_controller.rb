class ApplicationController < ActionController::Base

    before_action :set_staff
    def set_staff
        @staffs = Staff.all
        @staffs_by_gender = Staff.group(:gender).count # this will return a hash like {"male" => 10, "female" => 15}
    end
      
    
end
