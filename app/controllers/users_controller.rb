class UsersController < ApplicationController
  respond_to :json, only: [:api_sign_in, :api_sign_out]

  def api_sign_in
    # params { user: { email: , password: } }
    # JWT - Json Web Token
    user = User.find_by_email(params[:user][:email])
    if user.blank?
      render json: { success: false, error: "User not found" } and return
    end
    if user.valid_password?(params[:user][:password])

      hmac_secret = Settings.jwt_secret
      payload = { user_id: user.id, exp: (Time.now.to_i + 30.minutes) }
      token = JWT.encode payload, hmac_secret, 'HS256'
      # decoded_token = JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }
      cookies[:jwt_token] = {value: token, http_only: true}

      render json: { success: true }
    else
      render json: { success: false, error: "wrong password" }
    end
  end




  # def api_sign_in
  #   user = User.find_by_email(params[:user][:email])
  #   if user.valid_password?(params[:user][:password])
  #     cookies[:user_jwt] = { value: user.generate_jwt, http_only: true }
  #     render json: { success: true }
  #   else
  #     render json: { success: false }, status: :unauthorized
  #   end
  # end
  # def api_sign_out
  #   reset_session
  #   render json: { success: true, status: :unauthorized }
  # end
end
