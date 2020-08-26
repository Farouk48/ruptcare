class PatientsController < ApplicationController
  before_action :set_patient, only: [:show]


  def index
    @patients = current_user.patients
  end

  def show
    @patient = Patient.new
  end

private

  def set_patient
  	@patient = Patient.find(params[:id])
  end


end
