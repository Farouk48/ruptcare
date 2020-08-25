class PharmasController < ApplicationController
  def index
    @pharmas = Pharma.where.not(latitude: nil, longitude: nil)
    @pharmas = Pharma.geocoded

    @markers = @pharmas.map do |pharma|
      {
        lat: pharma.latitude,
        lng: pharma.longitude
      }
    end
  end
end
