class ClubMembersController < ApplicationController
  before_action :set_club_member, only: %i[ show edit update destroy ]
  before_action :restrict_show_access, only: [:show, :index]

  # GET /club_members or /club_members.json
  def index
    @club_members = ClubMember.all
  end

  # GET /club_members/1 or /club_members/1.json
  def show
  end

  # GET /club_members/new
  def new
    @club_member = ClubMember.new
    @student = Student.find(params[:student_id])
    @categories = ['Academic', 'Sports', 'Uniformed Units']
  end
  


  # GET /club_members/1/edit
  def edit
  end


  def create
    student_id = params[:club_member][:student_id]
    club_ids = params[:club_member][:club_id]
  
    # Find the student based on student_id
    student = Student.find(student_id)
  
    # Delete existing club memberships for the student
    ClubMember.where(student_id: student.id).destroy_all

    # Create a new ClubMember for each club_id with the student
    club_ids.each do |category, club_id|
      ClubMember.create(student_id: student.id, club_id: club_id)
    end

    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "Club members were successfully created." }
    end
  end

  # PATCH/PUT /club_members/1 or /club_members/1.json
  def update
    respond_to do |format|
      if @club_member.update(club_member_params)
        format.html { redirect_to club_member_url(@club_member), notice: "Club member was successfully updated." }
        format.json { render :show, status: :ok, location: @club_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @club_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_members/1 or /club_members/1.json
  def destroy
    @club_member.destroy!

    respond_to do |format|
      format.html { redirect_to club_members_url, notice: "Club member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_member
      @club_member = ClubMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_member_params
      params.require(:club_member).permit(:student_id, club_id: [:Academic, :Sports, :'Uniformed Units'])
    end

    def restrict_show_access
      
      flash[:alert] = "Access to this page is restricted."
      redirect_to dashboard_path
    end
    
end
