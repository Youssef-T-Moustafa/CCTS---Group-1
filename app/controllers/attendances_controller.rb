class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]
  # before_action :set_activity, only: [:create]

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @students = Student.all
    @attendance = Attendance.new  # Initialize a new Attendance object
  end

  # def create
  #   activity_id = params[:activity_id]
  #   student_ids = params[:attendance][:student_ids]
  
  #   student_ids.each do |student_id|
  #     @attendance = Attendance.new(:activity_id, student_id)
  #     Attendance.create(activity_id: activity_id, student_id: student_id)
  #   end
  
  #   redirect_to activities_path, notice: 'Attendances were successfully recorded'
  # end

  def create
    activity_id = params[:attendance][:activity_id]
    student_ids = params[:attendance][:student_ids]
  
    attendances = student_ids.map do |student_id|
      Attendance.new(activity_id: activity_id, student_id: student_id)
    end
  
    respond_to do |format|
      if Attendance.import(attendances)  # Assuming you're using a bulk insert method like 'activerecord-import'
        format.html { redirect_to attendances_path, notice: "Attendances were successfully created." }
        format.json { render :index, status: :created, location: @attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end
  

  

  # GET /attendances/1/edit
  def edit
  end


  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully updated." }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy!

    respond_to do |format|
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      # params.require(:attendance).permit(:activity_id, :student_id)
      params.require(:attendance).permit(:activity_id, student_ids: [])
    end

    

end
