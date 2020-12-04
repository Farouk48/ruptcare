class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
    @patients = policy_scope(Patient).order(created_at: :desc)
    # if params[:first_name].present?
    #   @patients = Patient.search_by_name_and_action(params[:first_name])
    # end
  end
    #@patients = current_user.patients
  def show
    #@patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    authorize @patient

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    authorize @patient
  end

  def update
    authorize @patient
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @drug, notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @patient
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patient_url, notice: 'Patient was successfully destroyed.' }
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :address, :age, :city, :chronic_disease, :doctor_id, :pharma_id)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
