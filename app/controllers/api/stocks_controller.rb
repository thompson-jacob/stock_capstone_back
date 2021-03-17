class Api::StocksController < ApplicationController
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def show
    @stock = Stock.find_by(ticker: params[:ticker])

    # https://financialmodelingprep.com/api/v3/shortquote/AAPL?apikey
    response = HTTP.get("https://financialmodelingprep.com/api/v3/historical-chart/5min/#{@stock.ticker}?apikey=#{Rails.application.credentials.fmp_api_key}")

    response1 = response.parse
    pp response1

    # response2 = response1.map { |data| data["date"] }
    response2 = response1.map
    pp response2
    # render json: {stock: @stock, price: response2}
    render json: { stock: @stock }
  end

  #Requires premium API or something
  def stock_news
    # response = HTTP.get("https://financialmodelingprep.com/api/v3/stock_news?limit=10?apikey=#{Rails.application.credentials.fmp_api_key}")
    # response = HTTP.get("https://financialmodelingprep.com/api/v3/search?query=AA&limit=10&exchange=NASDAQ&apikey=#{Rails.application.credentials.fmp_api_key}")
    response = HTTP.get("https://financialmodelingprep.com/api/v3/stock_news?tickers=#{params[:ticker]}&limit=50&apikey=#{Rails.application.credentials.fmp_api_key}")
    render json: response.parse
  end

  def stock_search
    response = HTTP.get("https://financialmodelingprep.com/api/v3/quote-short/#{params[:ticker]}?apikey=#{Rails.application.credentials.fmp_api_key}")
    data = response.parse[0]
    pp data
    stock = Stock.find_by(ticker: params[:ticker])
    if stock
      data["id"] = stock.id
      data["favorited"] = current_user ? !!current_user.user_stocks.find_by(stock_id: stock.id) : false
    else
      data["id"] = nil
      data["favorited"] = false
    end
    render json: data
  end

  def chart_stock
    response = HTTP.get("https://financialmodelingprep.com/api/v3/historical-chart/5min/#{params[:ticker]}?apikey=#{Rails.application.credentials.fmp_api_key}")
    render json: response.parse
  end

  def create
    @stock = Stock.new(
      ticker: params[:ticker],
      current_price: params[:current_price],
    )
    if @stock.save!
      render json: @stock.ticker + "added to list"
    else
      render json: { errors: @stock.errors.full_messages }, status: :bad_request
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
    render json: { message: "destroyed from database" }
  end
end
