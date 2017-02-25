class UsersController < ApplicationController
  respond_to :json, only: [:api_sign_in, :api_sign_out]
  def api_sign_in
    user = User.find_by_email(params[:user][:email])
    if user.valid_password?(params[:user][:password])
      cookies[:user_jwt] = { value: user.generate_jwt, http_only: true }
      render json: { success: true }
    else
      render json: { success: false }, status: :unauthorized
    end
  end
  def api_sign_out
    reset_session
    render json: { success: true, status: :unauthorized }
  end
end
