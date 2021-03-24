class Api::UserStocksController < ApplicationController
  before_action :authenticate_user

  def index
    # if current_user
    @user_stocks = current_user.user_stocks
    # @user_stocks = UserStock.all
    render json: @user_stocks.as_json(include: :stock)
    # else
    #   render json: {errors: "whatever"}
    # end
  end
  #TODO 
  #Add functionality to get stock id and current price to auto-push to DB
  
  def create
    stock = Stock.find_or_create_by(ticker: params[:ticker])
    @favorite = UserStock.new(
      stock_id: stock.id,
      user_id: current_user.id,
    )
    if @favorite.save
      render json: @favorite.stock.ticker + "added to list"
    else
      render json: { errors: @favorite.errors.full_messages }, status: :bad_request
    end
  end

  def destroy_all
    # @favorite = UserStock.find_by(id: params[:id])
    @favorites = UserStock.where(user_id: current_user.id, stock_id: params[:stock_id])
    @favorites.destroy_all
    render json: {message: " destroyed all"}
  end

  def toggle
    # params[:favorite]
    # params[:stock_id]
    # if else to create 
    #findordestroy
  end
end
