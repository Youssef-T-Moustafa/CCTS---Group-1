class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]


  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
  
    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @clubs = Club.all
  end

  # GET /activities/1/edit
  def edit
  end

  # GET /activities/editBudget
  def editBudget
    @activities = Activity.all
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
def update
  respond_to do |format|
    if activity_params[:update_type] == 'budget'
      if @activity.update(activity_params.except(:update_type))
        format.json { render json: { success: true, message: 'Budget was successfully updated.' } }
      else
        format.json { render json: { success: false, message: 'Failed to update budget.' }, status: :unprocessable_entity }
      end
    else
      if @activity.update(activity_params.except(:update_type))
        format.html { redirect_to activity_url(@activity) }
        format.json { render :show, status: :ok, location: @activity }
      else
        Rails.logger.error @activity.errors.inspect
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy!

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id]) if params[:id].present?
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:activity_title, :description, :start_date, :end_date, :allocated_budget, :club_id, :achievement, :update_type)
    end
end
