# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
#  Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#USERS
User.create!({name: "test name", email: 'test@email.com', password: "password", phone_number: "145345334" })
User.create!({name: "test2 name", email: 'test2@email.com', password: "password", phone_number: "245345334" })
User.create!({name: "test3 name", email: 'test3@email.com', password: "password", phone_number: "345345334" })
User.create!({name: "test4 name", email: 'test4@email.com', password: "password", phone_number: "445345334" })
User.create!({name: "jacob", email: 'cobalt7291@gmail.com', password: "password", phone_number: "445345334" })

#Stocks 
Stock.create!({ticker: "SPCE", current_price: 34.88})
Stock.create!({ticker: "GME", current_price: 100.00})
Stock.create!({ticker: "DIS", current_price: 189.44})
Stock.create!({ticker: "ARKK", current_price: 134.88})
Stock.create!({ticker: "ARKG", current_price: 84.98})
Stock.create!({ticker: "TSLA", current_price: 700.98})
Stock.create!({ticker: "AAPL", current_price: 244.98})



#USER_STOCKS
UserStock.create!({stock_id: 1, ticker: "SPCE", user_id: 1, view_type: "chart"})
UserStock.create!({stock_id: 1, ticker: "SPCE", user_id: 2, view_type: "financial"})
UserStock.create!({stock_id: 6, ticker: "TSLA", user_id: 1, view_type: "chart"})
UserStock.create!({stock_id: 4, ticker: "ARKK", user_id: 2, view_type: "chart"})
UserStock.create!({stock_id: 7, ticker: "AAPL", user_id: 4, view_type: "chart"})

#PRICES
Price.create!({stock_id: 1, ticker: "SPCE", open: 43.55, close:45.43, high: 48.23, low: 42.98})
Price.create!({stock_id: 2, ticker: "GME", open: 43.55, close:45.43, high: 48.23, low: 42.98})
Price.create!({stock_id: 3, ticker: "DIS", open: 43.55, close:45.43, high: 48.23, low: 42.98})
Price.create!({stock_id: 4, ticker: "ARKK", open: 43.55, close:45.43, high: 48.23, low: 42.98})


#TO_DO 
#finish creating fully drafted seeds file X
#start researching how to chart simple bar graph with seed file