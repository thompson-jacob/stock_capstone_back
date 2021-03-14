class Api::UserStocksController < ApplicationController
  before_action :authenticate_user

  def index
    # if current_user 
    @user_stocks = current_user.user_stocks
    # @user_stocks = UserStock.all
    render json: { message: @user_stocks}
    # else 
    #   render json: {errors: "whatever"}
    # end
  end
end