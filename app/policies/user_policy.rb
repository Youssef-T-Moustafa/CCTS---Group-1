class UserPolicy
    attr_reader :user, device # Use attr_reader instead of attr_accessor
  
    def initialize(user, device)
      @user = user
      @device = device
    end
  
    def can_login?
      # Only staff can login from a phone device
      user.staff? || device != "phone"
    end
  
    def login_path
      # Redirect staff to the activity_path when the device is a phone
      if user.staff? && device == "phone"
        "/activity_path"
      elsif user.staff?
        "/staff_dashboard"
      else
        "/home"
      end
    end
end
