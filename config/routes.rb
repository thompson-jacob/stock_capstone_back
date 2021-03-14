Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do

    #STOCKS
    get "/stocks" => "stocks#index"
    get "/stocks/:id" => "stocks#show"
    post "/stocks" => "stocks#create"
    patch "/stocks/:id" => "stocks#update"
    delete "/stocks/:id" => "stocks#destroy"
    #SESSIONS
    post "/sessions" => "sessions#create"
    #USERS
    post "/users" => "users#create"
    #USERSTOCKS
    get "/userstocks" => "user_stocks#index"
    get "/userstocks/:id" => "userstocks#show"
    post "/userstocks" => "userstocks#create"
    patch "/userstocks/:id" => "userstocks#update"
    delete "/userstocks/:id" => "userstocks#destroy"
    # TODO
    #PRICES
  end
end
