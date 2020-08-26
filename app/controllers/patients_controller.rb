class PatientsController < ApplicationController
  before_action :set_patient, only: [:show]

  def index

    @patients = Patient.all
    @patients = policy_scope(Patient).order(created_at: :desc)

    # @patients = current_user.patients

  end

  def show
    @patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.new
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
    @patient = Patient.find(params[:id])
    authorize @patient
  end

  def update
    authorize @patient
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update()
        format.html { redirect_to @drug, notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @patient
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patient_url, notice: 'Patient was successfully destroyed.' }
    end
  end

  private

  def patient_params
    params.permit(:patient).require(:first_name, :last_name, :address, :age, :city, :chronic_disease, :doctor_id, :pharma_id)
  end

private

  def set_patient
  	@patient = Patient.find(params[:id])
  end


end
