class StaffActivitiesController < ApplicationController
  before_action :set_staff_activity, only: %i[ show edit update destroy ]

  # GET /staff_activities or /staff_activities.json
  def index
    @staff_activities = StaffActivity.all

  end

  # GET /staff_activities/1 or /staff_activities/1.json
  def show
  end

  # GET /staff_activities/new
  def new
    @staff_activity = StaffActivity.new
  end

  # GET /staff_activities/1/edit
  def edit
  end

  # POST /staff_activities or /staff_activities.json
  def create
    @staff_activity = StaffActivity.new(staff_activity_params)

    respond_to do |format|
      if @staff_activity.save
        format.html { redirect_to staff_activity_url(@staff_activity), notice: "Staff activity was successfully created." }
        format.json { render :show, status: :created, location: @staff_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_activities/1 or /staff_activities/1.json
  def update
    respond_to do |format|
      if @staff_activity.update(staff_activity_params)
        format.html { redirect_to staff_activity_url(@staff_activity), notice: "Staff activity was successfully updated." }
        format.json { render :show, status: :ok, location: @staff_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_activities/1 or /staff_activities/1.json
  def destroy
    @staff_activity.destroy!

    respond_to do |format|
      format.html { redirect_to staff_activities_url, notice: "Staff activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_activity
      @staff_activity = StaffActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_activity_params
      params.require(:staff_activity).permit(:staff_id, :activity_id)
    end
end
