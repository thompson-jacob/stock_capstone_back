class Api::StocksController < ApplicationController

  def index
    @stocks = Stock.all
    render json: @stocks
  end
  
  def show 
    @stock = Stock.find_by(id: params[:id])
    render json: @stock
  end

  def create
    @stock = Stock.new(
      ticker: params[:ticker],
      current_price: params[:current_price],
      
    )
    if @stock.save!
      render json: @stock.ticker + "added to list"
    else
      render json: {errors: @stock.errors.full_messages}, status: :bad_request
    end
  end

  def update 
    @stock = Stock.find_by(id: params[:id])
    @stock.ticker = params[:ticker] || @stock.ticker
    @stock.current_price = params[:current_price] || @stock.current_price
    render json: @stock
  end

  def destroy 
    @stock = Stock.find_by(id: params[:id])
    @stock.destroy!
    render json: {message: "destroyed from database"}
  end
end
