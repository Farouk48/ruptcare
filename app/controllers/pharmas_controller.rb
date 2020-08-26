class PharmasController < ApplicationController
  def index
    @pharmas = Pharma.geocoded

    @markers = @pharmas.map do |pharma|
      {
        lat: pharma.latitude,
        lng: pharma.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pharma: pharma })
      }
    end
  end
end
