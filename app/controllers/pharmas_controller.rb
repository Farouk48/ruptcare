class PharmasController < ApplicationController
  def index
    @pharmas = policy_scope(Pharma).order(created_at: :desc)
    @pharmas = Pharma.where.not(latitude: nil, longitude: nil)

    @pharmas = Pharma.geocoded
    @drug = Drug.find(params[:drug_id]) if params[:drug_id]

    @user_pharma = Pharma.first
    @markers = @pharmas.reject { |exclude| exclude == @user_pharma }.map do |pharma|
      {
        lat: pharma.latitude,
        lng: pharma.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pharma: pharma }),
        image_url: helpers.asset_url('clinic-medical-solid.svg')

      }
    end
    #  @marker = @pharmas.map do
    #   {
    #     lat: @pharmas.first.latitude,
    #     lng: @pharmas.first.longitude,
    #   }
    # end
  end

  def new
    @pharma = Pharma.new
  end

  def show
    @pharma = Pharma.find(params[:id])

    authorize @pharma
  end

  def create
    @pharma = Pharma.new
    @pharma.user = current_user
    authorize @pharma

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @pharma, notice: 'Pharma was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @pharma = Drug.find(params[:id])
    authorize @pharma
  end

  def update
    authorize @pharma
    @pharma = Pharma.find(params[:id])

    respond_to do |format|
      if @pharma.update()
        format.html { redirect_to @pharma, notice: 'Pharma was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @pharma
    @pharma = Pharma.find(params[:id])
    @pharma.destroy

    respond_to do |format|
      format.html { redirect_to pharma_url, notice: 'Pharma was successfully destroyed.' }
    end
  end

  private

  def pharma_params
    params.permit(:pharma).require(:name, :address, :city)
  end
end
