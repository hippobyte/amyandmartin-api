# frozen_string_literal: true

#
# Secured
#
module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  private

  def authenticate_request
    response = Auth.authenticate(headers: request.headers)
    return if response.authenticated?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  # Auth
  class Auth
    class << self
      def authenticate(headers:)
        new(headers: headers)
      end
    end

    def initialize(headers:)
      @headers = headers['Authorization']
    end

    def authenticated?
      @headers.present? && @headers == ENV['AUTH_SECRET']
    end
  end
end
