class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.day.from_now.to_i # the expiration time
        },
        # "random", # the secret key
        Rails.application.credentials.fetch(:secret_key_base),
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
