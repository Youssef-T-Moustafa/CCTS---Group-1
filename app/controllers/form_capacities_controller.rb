# app/controllers/form_capacities_controller.rb
class FormCapacitiesController < ApplicationController
  before_action :find_club

  def edit
    @form_capacity = @club.form_capacity || @club.build_form_capacity
  end

  def update
    @form_capacity = @club.form_capacity || @club.build_form_capacity
    if @form_capacity.update(form_capacity_params)
      redirect_to @club, notice: 'Form Capacity updated successfully.'
    else
      render :edit
    end
  end

  private

  def find_club
    @club = Club.find(params[:club_id])
  end

  def form_capacity_params
    params.require(:form_capacity).permit(:f1, :f2, :f3, :f4, :f5)
  end
end
