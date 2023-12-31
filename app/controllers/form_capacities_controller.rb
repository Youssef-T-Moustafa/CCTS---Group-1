# app/controllers/form_capacities_controller.rb
class FormCapacitiesController < ApplicationController
  before_action :find_club

  # Existing code...

  def edit
    @form_capacity = @club.form_capacity || @club.build_form_capacity
  end

  def update
    @form_capacity = @club.form_capacity || @club.build_form_capacity
    if @form_capacity.update(form_capacity_params)
      flash[:success] = "Form Capacities updated successfully!"
      redirect_to_referer_or_club
    else
      flash[:warning] = "Total form capacity exceeds maximum club capacity, please try again!"
      redirect_to_referer_or_club
    end
  end

  private

  def find_club
    @club = Club.find(params[:club_id])
  end

  def form_capacity_params
    params.require(:form_capacity).permit(:f1, :f2, :f3, :f4, :f5)
  end

  def store_referer_url
    session[:referer_url] = request.referer
  end

  def redirect_to_referer_or_club
    redirect_to(session.delete(:referer_url) || @club)
  rescue ActionController::RedirectBackError
    redirect_to @club
  end
end
