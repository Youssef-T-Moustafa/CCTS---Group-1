class ExtraActivitiesController < ApplicationController
  before_action :set_extra_activity, only: %i[ show edit update destroy ]

  # GET /extra_activities or /extra_activities.json
  def index
    @extra_activities = ExtraActivity.all
  end

  # GET /extra_activities/1 or /extra_activities/1.json
  def show
  end

  # GET /extra_activities/new
  def new
    @extra_activity = ExtraActivity.new
  end

  # GET /extra_activities/1/edit
  def edit
  end

  # POST /extra_activities or /extra_activities.json
  def create
    @extra_activity = ExtraActivity.new(extra_activity_params)
    @extra_activity.student_id = current_user.id # Assign current_user.id to student_id
    
    #to upload evidence
    if params[:extra_activity][:evidence]
      uploaded_file = params[:extra_activity][:evidence]
      binary_data = uploaded_file.read
      @extra_activity.evidence = {
        data: Base64.encode64(binary_data),
        filename: uploaded_file.original_filename,
        content_type: uploaded_file.content_type
      }
    end


    respond_to do |format|
      if @extra_activity.save
        format.html { redirect_to extra_activity_url(@extra_activity) }
        format.json { render :show, status: :created, location: @extra_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @extra_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extra_activities/1 or /extra_activities/1.json
  def update
        #to update evidence

    if params[:extra_activity][:evidence]
      uploaded_file = params[:extra_activity][:evidence]
      binary_data = uploaded_file.read
      @extra_activity.evidence = {
        data: Base64.encode64(binary_data),
        filename: uploaded_file.original_filename,
        content_type: uploaded_file.content_type
      }
    end
    respond_to do |format|
      if @extra_activity.update(extra_activity_params)
        format.html { redirect_to extra_activity_url(@extra_activity) }
        format.json { render :show, status: :ok, location: @extra_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @extra_activity.errors, status: :unprocessable_entity }
      end
    end


  end
  
  #to upload evidence
  def extra_activity_params
    params.require(:extra_activity).permit(:name, :description, :student_id, :start_date, :end_date)
  end

  #to upload evidence
  def evidence
    extra_activity = ExtraActivity.find(params[:id])
    send_data(Base64.decode64(extra_activity.evidence['data']), 
              type: extra_activity.evidence['content_type'], 
              disposition: 'attachment; filename="' + extra_activity.evidence['filename'] + '"')
  end
  
  

  # DELETE /extra_activities/1 or /extra_activities/1.json
  def destroy
    @extra_activity.destroy!

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_activity
      @extra_activity = ExtraActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extra_activity_params
      params.require(:extra_activity).permit(:name, :description, :student_id, :start_date, :end_date)
    end
end
