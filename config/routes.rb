Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do

    #STOCKS
    get "/stock_news" => "stocks#stock_news"
    get "/stock_search" => "stocks#stock_search"
    get "/stocks" => "stocks#index"
    get "/stocks" => "stocks#chart_stock"
    get "/stocks/:ticker" => "stocks#show"
    post "/stocks" => "stocks#create"
    patch "/stocks/:id" => "stocks#update"
    delete "/stocks/:id" => "stocks#destroy"
    #SESSIONS
    post "/sessions" => "sessions#create"
    #USERS
    post "/users" => "users#create"
    #USERSTOCKS
    get "/userstocks" => "user_stocks#index"
    get "/userstocks/:id" => "user_stocks#show"
    post "/userstocks" => "user_stocks#create"
    patch "/userstocks/:id" => "user_stocks#update"
    delete "/userstocks/:id" => "user_stocks#destroy"
    delete "/userstocks" => "user_stocks#destroy_all"

    # TODO
    #PRICES
  end
end
