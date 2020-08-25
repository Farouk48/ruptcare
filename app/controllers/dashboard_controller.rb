class DashboardController < ApplicationControllers
  def index
    @patients = current_user.patients
  end
end
