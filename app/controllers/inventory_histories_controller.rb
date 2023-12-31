class InventoryHistoriesController < ApplicationController
  before_action :set_inventory_history, only: %i[ show edit update destroy ]

  # GET /inventory_histories or /inventory_histories.json
  def index
    @inventory_histories = InventoryHistory.all
  end

  # GET /inventory_histories/1 or /inventory_histories/1.json
  def show
  end

  # GET /inventory_histories/new
  def new
    @inventory_history = InventoryHistory.new
    @inventory = Inventory.find(params[:inventory_id])
  end

  # GET /inventory_histories/1/edit
  def edit
  end

  # POST /inventory_histories or /inventory_histories.json
  def create
    @inventory_history = InventoryHistory.new(inventory_history_params)
  
    respond_to do |format|
      if @inventory_history.save
        # Update the quantity of the associated inventory
        @inventory = @inventory_history.inventory
        new_quantity = @inventory_history.quantity
        @inventory.update(quantity: new_quantity)
  
        format.html { redirect_to inventories_url, notice: "Inventory quantity has successfully been updated." }
        format.json { render :show, status: :created, location: @inventory_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_histories/1 or /inventory_histories/1.json
  def update
    respond_to do |format|
      if @inventory_history.update(inventory_history_params)
        format.html { redirect_to inventory_history_url(@inventory_history), notice: "Inventory history was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_histories/1 or /inventory_histories/1.json
  def destroy
    @inventory_history.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_histories_url, notice: "Inventory history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_history
      @inventory_history = InventoryHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_history_params
      params.require(:inventory_history).permit(:inventory_id, :quantity)
    end
end
