# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
     render json: { status: 200, message: "Signed in sucessfully", data: current_user }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payloaad = JWT.decode(request.headers["Authorization"]&.split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first

    user = User.find_by(id: jwt_payloaad['sub'])

    if user.present?
        render json: { status: 200, message: "Signed out sucessfully"}, status: :ok
    else
        render json: { status: 401, message: "User has no active session"}, status: :unauthorized
    end
  end
end
