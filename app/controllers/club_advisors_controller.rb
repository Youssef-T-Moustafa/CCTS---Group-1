class ClubAdvisorsController < ApplicationController
  before_action :set_club_advisor, only: %i[ show edit update destroy ]

  # GET /club_advisors or /club_advisors.json
  def index
    @club_advisors = ClubAdvisor.all
  end

  # GET /club_advisors/1 or /club_advisors/1.json
  def show
  end

  # GET /club_advisors/new
  def new
    @club_advisor = ClubAdvisor.new
  end

  # GET /club_advisors/1/edit
  def edit
  end

  # POST /club_advisors or /club_advisors.json
  def create
    @club_advisor = ClubAdvisor.new(club_advisor_params)

    respond_to do |format|
      if @club_advisor.save
        format.html { redirect_to club_advisor_url(@club_advisor), notice: "Club advisor was successfully created." }
        format.json { render :show, status: :created, location: @club_advisor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @club_advisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_advisors/1 or /club_advisors/1.json
  def update
    respond_to do |format|
      if @club_advisor.update(club_advisor_params)
        format.html { redirect_to club_advisor_url(@club_advisor), notice: "Club advisor was successfully updated." }
        format.json { render :show, status: :ok, location: @club_advisor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @club_advisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_advisors/1 or /club_advisors/1.json
  def destroy
    @club_advisor.destroy!

    respond_to do |format|
      format.html { redirect_to club_advisors_url, notice: "Club advisor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_advisor
      @club_advisor = ClubAdvisor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_advisor_params
      params.require(:club_advisor).permit(:club_id, :staff_id)
    end
end
