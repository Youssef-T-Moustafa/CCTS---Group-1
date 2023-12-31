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
            student_attributes = ["Student ID", "First Name", "Last Name", "Gender", "Parent Phone", "Parent Email", "Score", "Stud ID", "Form"]
            csv << student_attributes
            @students.each do |student|
              csv << [student.id, student.first_name, student.last_name, student.gender, student.parent_phone, student.parent_email, student.score, student.stud_id, student.form]
            end
            csv << [""]
    
            # Staffs data
            staff_attributes = ["Staff ID", "First Name", "Last Name", "Gender", "Email", "Phone"]
            csv << staff_attributes
            @staffs.each do |staff|
              csv << [staff.id, staff.first_name, staff.last_name, staff.gender, staff.email, staff.phone]
            end
          end
    
          send_data csv_data, filename: report_name
        end
      end
    end
end
