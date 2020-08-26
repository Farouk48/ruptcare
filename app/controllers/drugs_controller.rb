class DrugsController < ApplicationController

  def index
  	if params[:query].present?
  		@drugs = Drug.search_by_name_and_actions(params[:query])
  	else
    @drugs = Drug.all
  end
  end
  
  def show
    @drug = Drug.find(params[:id])
  end
end
