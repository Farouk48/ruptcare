class PatientsController < ApplicationController
  def index
    @patients = current_user.patients
  end

  def show
    @patient = Patient.new
  end
end
