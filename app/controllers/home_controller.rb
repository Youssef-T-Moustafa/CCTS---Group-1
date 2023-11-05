# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    # Set the @date variable based on the start_date parameter or default to Date.today
    @date = params[:start_date] ? Date.parse(params[:start_date]) : Date.today
    # ... rest of your index action code ...
    @events = []
  end
end
