class SessionsController < ApplicationController
  def create
    student = Student.find_by(parent_email: params[:session][:email])
    staff = Staff.find_by(email: params[:session][:email])
    admin = Admin.find_by(email: params[:session][:email])
  
    if request.user_agent =~ /Mobile|webOS/ 
      if staff && staff.authenticate(params[:session][:password])
        log_in(staff)
        redirect_to dashboard_path  
      else
        flash.now[:alert] = 'Invalid email or password.'
        render :new, layout: false
      end
    else
      if student && student.authenticate(params[:session][:password])
        log_in(student)
        redirect_to dashboard_path
      elsif staff && staff.authenticate(params[:session][:password])
        log_in(staff)
        redirect_to dashboard_path
      elsif admin && admin.authenticate(params[:session][:password])
        log_in(admin)
        redirect_to dashboard_path
      else
        flash.now[:alert] = 'Invalid email or password.'
        render :new, layout: false
      end
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
  
  def new
    render layout: false
  end
end