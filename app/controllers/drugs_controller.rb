class DrugsController < ApplicationController

  def index
    @drugs = Drug.all
    @main_drug = @drugs.first
  end

  def show
    @drug = Drug.find(params[:id])
  end
end
