# frozen_string_literal: true

module Api
  # GuestController
  class GuestController < ApiController
    def summary
      render json: GuestMetrics.summary, status: :accepted
    end
  end
end
