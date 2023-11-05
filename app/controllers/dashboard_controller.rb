class DashboardController < ApplicationController
    def index
    @staffs_count = Staff.count
    @students_count = Student.count
    @activities_count = Activity.count

    puts "Staffs Count: #{@staffs_count}"
    puts "Students Count: #{@students_count}"
    puts "Activities Count: #{@activities_count}"
    end
end
