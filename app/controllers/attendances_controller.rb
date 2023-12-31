class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  #get media
  def media
    attendance = Attendance.find(params[:id])
    activity = Activity.find(attendance.activity_id)
    send_data(Base64.decode64(activity.media['data']), 
              type: activity.media['content_type'], 
              disposition: 'attachment; filename="' + activity.media['filename'] + '"')
  end
  

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @activity_id = params[:activity_id]
    @activity = Activity.find(params[:activity_id])
    @club = @activity.club
    @students = @club.students
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create

    existing_attendances = Attendance.where(
      activity_id: attendance_params[:activity_id]
    )
    existing_attendances.destroy_all
    student_ids = params[:attendance][:student_ids]

    student_ids.each do |student_id|
      attendance = Attendance.new(activity_id: params[:attendance][:activity_id], student_id: student_id)

      unless attendance.save
        # Handle the case where saving fails
        render :new, status: :unprocessable_entity
        return
      end
    end

    # redirect_to attendances_url, notice: 'Attendances were successfully recorded.'
    redirect_to staffs_path, notice: 'Attendances were successfully recorded.'
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
      params.require(:attendance).permit(:activity_id, :student_id)
    end
end
