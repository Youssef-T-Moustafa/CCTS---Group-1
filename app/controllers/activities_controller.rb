class ActivitiesController < ApplicationController
    before_action :set_activity, except: [:displayactivity]
    skip_before_action :set_activity, only: [:displayactivity]
    protect_from_forgery with: :null_session, only: [:upload]


  # GET /activities or /activities.json
  def index
    @activities = Activity.all
    
  end

  #upload media
  def upload
    uploaded_file = params[:mediaFile]
    
    # Convert the uploaded file to binary
    binary_data = uploaded_file.read
    
    # Find the activity where you want to store the media
    activity = Activity.find(params[:id])
    
    # Store the binary data in the 'media' column
    # You might want to store the original filename and content type as well
    activity.media = {
      data: Base64.encode64(binary_data),
      filename: uploaded_file.original_filename,
      content_type: uploaded_file.content_type
    }
    
    # Save the activity
    if activity.save
      flash[:notice] = 'File uploaded successfully'
    else
      flash[:alert] = 'There was an error uploading the file'
    end
  
    redirect_to action: 'show', id: activity.id
    
  end
  
  

  def media
    activity = Activity.find(params[:id])
    send_data(Base64.decode64(activity.media['data']), 
              type: activity.media['content_type'], 
              disposition: 'inline')
  end
  


    # GET /activities/1 or /activities/1.json
    def show
      @activities = Activity.all
      @activity = Activity.find_by(id: params[:id])
    end

    # GET /activities/new
    def new
      @activity = Activity.new
      @clubs = Club.all
      @club = Club.find(params[:club_id]) if params[:club_id].present?
      @club_names = Club.pluck(:name, :id)
    end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
    # @activity.staff_activities.build(staff_id: current_user.id)
    
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

    # GET /activities/1/edit
    def edit
      @club_names = Club.pluck(:name, :id)
    end


  def update
    if activity_params[:update_type] == 'status'
      if activity_params[:status].in?(['approved', 'rejected'])
        if update_status(activity_params[:status])
          render json: { status: activity_params[:status].capitalize }
        else
          render json: { error: 'Invalid status or insufficient budget' }, status: :unprocessable_entity
        end
      else
        render json: { error: 'Invalid status' }, status: :unprocessable_entity
      end
    else
      respond_to do |format|
        if @activity.update(activity_params.except(:update_type, :status))
          format.html { redirect_to action: 'show', id: @activity.id, notice: 'Budget successfully updated' }
          format.json { render json: { message: 'Budget successfully updated' } }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: { error: 'Failed to update budget' }, status: :unprocessable_entity }
        end
      end
    end
  end

  def approve_budget
    if @activity.status == 'Pending'
      ActiveRecord::Base.transaction do
        @activity.update(status: 'Approved')
        club = @activity.club
        club.update(budget: club.budget - @activity.requested_budget) if club.present?
      end
      true
    else
      false
    end
  end

  def reject_budget
    # Implement the logic to reject the budget here
    # For example:
    if @activity.status == 'Pending' # Adjust this condition based on your logic
      @activity.update(status: 'Rejected')
      true
    else
      false
    end
  end


    def update_status(new_status)
      if new_status == 'approved' && approve_budget
        true
      elsif new_status == 'rejected' && reject_budget
        true
      else
        false
      end
    end
  



    # DELETE /activities/1 or /activities/1.json
    def destroy
      @activity.staff_activities.destroy_all
      @activity.attendances.destroy_all
      @activity.destroy!
        redirect_to dashboard_path, notice: "Activity was successfully destroyed."
    end

  # app/controllers/activities_controller.rb

  def displayactivity
    @clubs = Club.includes(:activities)

    if @clubs.present?
      # Render the view
    else
      Rails.logger.debug("No clubs found: #{@clubs}")
      redirect_to activities_path, alert: 'No clubs found.'
    end
  end


    def finance
      @clubs = Club.all
      @activities = Activity.all
    end

    def editBudget
      @activities = Activity.all
    end

    def allocate_budget
      if @activity.present? && @activity.status == 'Approved'
        club = @activity.club
        if club.present? && club.budget >= @activity.requested_budget
          club.update(budget: club.budget - @activity.requested_budget)
          redirect_to activity_path(@activity), notice: 'Budget successfully allocated.'
        else
          redirect_to activity_path(@activity), alert: 'Insufficient budget for allocation.'
        end
      else
        redirect_to activities_path, alert: 'Activity not found or budget not approved.'
      end
    end
    
    private
    
    def set_activity
      @activity = params[:id].present? && params[:id] != 'displayactivity' ? Activity.find(params[:id]) : nil
    end
    
    def activity_params
      params.require(:activity).permit(:activity_title, :description, :start_date, :end_date, :requested_budget, :club_id, :update_type, :status)
    end
end