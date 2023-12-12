class ActivitiesController < ApplicationController
    before_action :set_activity, except: [:displayactivity]
    skip_before_action :set_activity, only: [:displayactivity]
    protect_from_forgery with: :null_session, only: [:upload]


  # GET /activities or /activities.json
  def index
    @activities = Activity.all
    
  end

  # upload file
  def upload
    
    uploaded_file = params[:mediaFile]
    # Define the directory where you want to store the uploaded files
    upload_directory = Rails.root.join('public', 'uploads')

    # Ensure the directory exists; create it if it doesn't
    FileUtils.mkdir_p(upload_directory) unless File.directory?(upload_directory)

    # Save the uploaded file to the specified directory
    File.open(File.join(upload_directory, uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end

    # upload file
    def upload
      
      uploaded_file = params[:mediaFile]
      # Define the directory where you want to store the uploaded files
      upload_directory = Rails.root.join('public', 'uploads')

      # Ensure the directory exists; create it if it doesn't
      FileUtils.mkdir_p(upload_directory) unless File.directory?(upload_directory)

      # Save the uploaded file to the specified directory
      File.open(File.join(upload_directory, uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
      end

      
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
      @activity.staff_activities.build(staff_id: current_user.id)
      
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
      # ... (existing code)
  
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
        if @activity.update(activity_params.except(:update_type, :status))
          render json: { message: 'Budget successfully updated' }
        else
          render json: { error: 'Failed to update budget' }, status: :unprocessable_entity
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
      @activity.destroy!

      respond_to do |format|
        format.html { redirect_to staffs_path, notice: "Activity was successfully destroyed." }
        format.json { head :no_content }
      end
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
end