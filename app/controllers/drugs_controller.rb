class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]

  def index
    @drugs = Drug.all
    @drugs = policy_scope(Drug).order(created_at: :desc)

    if params[:name].present?
      @drugs = Drug.search_by_name_and_action(params[:name])
        if @drugs.empty?
        @empty = true
        else
        @empty = false
        @drugs = Drug.where(drugs_class: @drugs.first.drugs_class).where.not("name ILIKE ?", "%#{params[:name]}%")#.to_a
        @main_drug = @drugs.first
        @search_drug = Drug.search_by_name_and_action(params[:name]).first
        end
    end
  end

  def show
    authorize @drug
  end

  def new
    @drug = Drug.new
    authorize @drug
  end

  def create
    @drug = Drug.new(drug_params)
    @drug.user = current_user
    authorize @drug

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    authorize @drug
  end

  def update
    authorize @drug
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @drug
    @drug.destroy

    respond_to do |format|
      format.html { redirect_to drug_url, notice: 'Drug was successfully destroyed.' }
    end
  end

  private

  def drug_params
    params.require(:drug).permit(:name, :drugs_class, :family, :action, :galenic, :posology, :recommandations, :availability, :commercialisation, :administration, :photo)
  end

  def set_drug
    @drug = Drug.find(params[:id])
  end
end
