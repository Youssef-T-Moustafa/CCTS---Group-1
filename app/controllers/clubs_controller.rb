class ClubsController < ApplicationController
  require 'csv'
  before_action :set_club, only: %i[ show edit update destroy ]

  # GET /clubs or /clubs.json
  def index
    @clubs = Club.all
  end

  def generate_report
    @clubs = Club.all
    @activities = Activity.all
  
    respond_to do |format|
      format.csv do
        report_name = "ClubsReport_#{Date.today.strftime('%Y-%m-%d')}.csv"
        headers['Content-Disposition'] = "attachment; filename=#{report_name}"
        headers['Content-Type'] ||= 'text/csv'
  
        csv_data = CSV.generate do |csv|
          # Clubs data
         # csv << ["Club ID", "Name", "Description", "Budget", "Capacity", "Supervised By", "Type"]
         csv << ["Club ID", "Name", "Description", "Budget (RM)", "Capacity",  "Type"]
          @clubs.each do |club|
            #csv << [club.id, club.name, club.description, club.budget, club.capacity, club.staff_id, "Club"]
            csv << [club.id, club.name, club.description, club.budget, club.capacity,  "Club"]
          end
          csv << [""]
          # Activities data
          csv << ["Activity ID", "Activity Title", "Description", "Start Date", "End Date", "Allocated Budget (RM)", "Club ID", "Type"]
          @activities.each do |activity|
            csv << [activity.id, activity.activity_title, activity.description, activity.start_date, activity.end_date, activity.requested_budget, activity.club_id, "Activity"]
          end
        end
  
        send_data csv_data, filename: report_name
      end
    end
  end


  def finance
    @clubs = Club.all
    @activities = Activity.all
  end

  def editBudget
    @clubs = Club.all
    @activities = Activity.all
  end

  # GET /clubs/1 or /clubs/1.json
  def show
    @club = Club.find(params[:id])
    @club = Club.includes(:form_capacity, :activities).find(params[:id])
    @club.form_capacity ||= @club.build_form_capacity
  end

  # GET /clubs/new
  def new

    @club = Club.new
    @club.build_form_capacity
  end

  # GET /clubs/1/edit
  def edit
    # @staff_members = Staff.all
  end

  # POST /clubs or /clubs.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to club_url(@club) }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /clubs/1 or /clubs/1.json
  def update
    @club = Club.find(params[:id])
    if club_params[:update_type] == 'budget'
      if @club.update(club_params.except(:update_type))
        render json: { success: true, message: 'Budget was successfully updated.' }
      else
        render json: { success: false, message: 'Failed to update budget.' }, status: :unprocessable_entity
      end
    else
      if @club.update(club_params.except(:update_type))
        redirect_to club_url(@club)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end


  # DELETE /clubs/1 or /clubs/1.json
  def destroy
    @club.destroy!

    respond_to do |format|
      format.html { redirect_to clubs_url}
      format.json { head :no_content }
    end
  end

  def show_students
    @club = Club.find(params[:club_id])
    @staff = Staff.find(params[:staff_id])
    @students = @club.students
    render 'clubs/show_students'
  end

  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

  # Only allow a list of trusted parameters through.
  def club_params
    params.require(:club).permit(:name, :description, :budget, :capacity, :categories,:update_type, form_capacity_attributes: [:f1, :f2, :f3, :f4, :f5])
  end


    def load_data
      @clubs = Club.all
      @activities = Activity.all
    end
  
end

