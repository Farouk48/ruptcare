class DrugsController < ApplicationController

  def index
    @drugs = Drug.all
    @drugs = policy_scope(Drug).order(created_at: :desc)

    if params[:name].present?

  		@drugs = Drug.search_by_name_and_action(params[:name])
      @drugs = Drug.where(drugs_class: @drugs.first.drugs_class).where.not("name ILIKE ?", "%#{params[:name]}%")
      @main_drug = @drugs.first
      @search_drug = Drug.search_by_name_and_action(params[:name]).first
  end
end

  def new
    @drug = Drug.new
    authorize @drug
  end

  def show
    @drug = Drug.find(params[:id])
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
    @drug = Drug.find(params[:id])
    authorize @drug
  end

  def update
    authorize @drug
    @drug = Drug.find(params[:id])

    respond_to do |format|
      if @drug.update()
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @drug
    @drug = Drug.find(params[:id])
    @drug.destroy

    respond_to do |format|
      format.html { redirect_to drug_url, notice: 'Drug was successfully destroyed.' }
    end
  end

  private

  def drug_params
    params.require(:drug).require(:name, :drugs_class, :family, :action, :galenic, :posology, :recommandations, :availability, :commercialisation, :administration, :photo)
  end
end
