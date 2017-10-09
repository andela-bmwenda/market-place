module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { error: e.message }, status: :unprocessable_entity
    end

    rescue_from ExceptionHandler::AuthenticationError, with: :authorization_error
    rescue_from ExceptionHandler::MissingToken, with: :authorization_error
    rescue_from ExceptionHandler::InvalidToken, with: :authorization_error
    rescue_from ExceptionHandler::ExpiredToken, with: :authorization_error
  end

  def authorization_error(error)
    render json: { error: error.message }, status: :unauthorized
  end
end
