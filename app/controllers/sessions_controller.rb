class SessionsController < ApplicationController

  def create

    puts "params[:session][:email] = #{params[:session][:email]}"
    puts "params[:session][:password] = #{params[:session][:password]}"
    puts "params[:session][:password_confirmation] = #{params[:session][:password_confirmation]}"
    student = Student.find_by(parent_email: params[:session][:email])
    staff = Staff.find_by(email: params[:session][:email])
    puts "student = #{student}"
    puts "staff = #{staff}"
    if student && student.authenticate(params[:session][:password])
      log_in(student)
      redirect_to dashboard_path
      
    elsif staff && staff.authenticate(params[:session][:password])
      log_in(staff)
      redirect_to dashboard_path
    else
      puts "Invalid password or email address"
      flash.now[:danger] = 'Invalid email/password combination'
      render layout: false
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
  

