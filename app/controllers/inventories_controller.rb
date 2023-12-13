class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]

  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1 or /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  def generate_report
    @inventories = Inventory.all
    @inventory_histories = InventoryHistory.all

    respond_to do |format|
      format.csv do
        report_name = "InventoryReport_#{Date.today.strftime('%Y-%m-%d')}.csv"
        headers['Content-Disposition'] = "attachment; filename=#{report_name}"
        headers['Content-Type'] ||= 'text/csv'

        csv_data = CSV.generate do |csv|
          # Inventories data
          csv << ["Inventory ID", "Name", "Description", "Quantity"]
          @inventories.each do |inventory|
            csv << [inventory.id, inventory.name, inventory.description, inventory.quantity]
          end
          csv << [""]
          # Inventory Histories data
          csv << ["History ID", "Inventory ID", "Quantity"]
          @inventory_histories.each do |history|
            csv << [history.id, history.inventory_id, history.quantity]
          end
        end

        send_data csv_data, filename: report_name
      end
    end
  end



  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
  
    if @inventory.save
      InventoryHistory.create(inventory: @inventory, quantity: @inventory.quantity)
      redirect_to inventories_path, notice: "Equipment was successfully added."
    else
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventories_path, notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy!

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:name, :description, :quantity)
    end  
end
