class PharmasController < ApplicationController
  before_action :set_pharma, only: [:show, :edit, :update, :destroy]

  def index
    @pharmas = policy_scope(Pharma).includes(:stock).order('stocks.quantity')
    @pharmas = Pharma.where.not(latitude: nil, longitude: nil)

    @pharmas = Pharma.geocoded
    @drug = Drug.find(params[:drug_id]) if params[:drug_id]

    @user_pharma = Pharma.first
    @markers = @pharmas.reject { |exclude| exclude == @user_pharma }.map do |pharma|
      {
        lat: pharma.latitude,
        lng: pharma.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pharma: pharma }),
        image_url: helpers.asset_url(category_markers(pharma)),
        id: pharma.id
      }
    end

    @available_pharmas = @pharmas.joins(:stocks).where(stocks:{drug:@drug}).where('stocks.quantity > ?', 0)
    #where('id >': 200)
    #  @marker = @pharmas.map do
    #   {
    #     lat: @pharmas.first.latitude,
    #     lng: @pharmas.first.longitude,
    #   }
    # end
  end

  def show
    authorize @pharma
  end

  def new
    @pharma = Pharma.new
  end

  def create
    @pharma = Pharma.new(pharma_params)
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
    authorize @pharma
  end

  def update
    authorize @pharma

    respond_to do |format|
      if @pharma.update(pharma_params)
        format.html { redirect_to @pharma, notice: 'Pharma was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @pharma
    @pharma.destroy

    respond_to do |format|
      format.html { redirect_to pharma_url, notice: 'Pharma was successfully destroyed.' }
    end
  end

  private

  def pharma_params
    params.require(:pharma).permit(:name, :address, :city)
  end

  def set_pharma
    @pharma = Pharma.find(params[:id])
  end

  def category_markers(pharmacy)
    if pharmacy.stocks.first.quantity > 0
      return "Greenhouse.svg"
    else
      return "Redhouse.svg"
    end
  end
end
