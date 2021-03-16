class Api::UserStocksController < ApplicationController
  before_action :authenticate_user

  def index
    # if current_user
    @user_stocks = current_user.user_stocks
    # @user_stocks = UserStock.all
    render json: { message: @user_stocks }
    # else
    #   render json: {errors: "whatever"}
    # end
  end
  #TODO 
  #Add functionality to get stock id and current price to auto-push to DB
  
  def create
    @favorite = UserStock.new(
      ticker: params[:ticker],
      user_id: current_user.id,
    )
    if @favorite.save!
      render json: @favorite.ticker + "added to list"
    else
      render json: { errors: @favorite.errors.full_messages }, status: :bad_request
    end
  end
end
