class DashboardController < ApplicationController
  require 'csv'
  def index
  end
  def generate_report
    @students = Student.all
    @staffs = Staff.all
  
    respond_to do |format|
      format.csv do
        report_name = "StudentsAndStaffReport_#{Date.today.strftime('%Y-%m-%d')}.csv"
        headers['Content-Disposition'] = "attachment; filename=#{report_name}"
        headers['Content-Type'] ||= 'text/csv'
  
        csv_data = CSV.generate do |csv|
          # Students data
          csv << ["Student ID", "First Name", "Last Name", "Gender", "Parent Phone", "Parent Email"]
          @students.each do |student|
            csv << [student.id, student.first_name, student.last_name, student.gender, student.parent_phone, student.parent_email]
          end
          csv << [""]
  
          # Staffs data
          csv << ["Staff ID", "First Name", "Last Name", "Gender", "Email", "Phone"]
          @staffs.each do |staff|
            csv << [staff.id, staff.first_name, staff.last_name, staff.gender, staff.email, staff.phone]
          end
        end
  
        send_data csv_data, filename: report_name
      end
    end
  end


end
