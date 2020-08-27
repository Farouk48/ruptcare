class StocksController < ApplicationController

def index
  @stocks = Stock.all
  @restaurants = policy_scope(Restaurant).order(created_at: :desc)
end

def new
  authorize @stock
  @stock = Stock.new
end

def create
  authorize @stock
  @stock = Stock.find(params[:id])
end
end
