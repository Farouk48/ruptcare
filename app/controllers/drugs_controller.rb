class DrugsController < ApplicationController
  def show
    @drug = Drug.find(params[:id])
  end
end
