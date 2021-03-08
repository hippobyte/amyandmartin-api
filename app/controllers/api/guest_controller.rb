# frozen_string_literal: true

module Api
  # GuestController
  class GuestController < ApiController
    before_action :set_data, only: [:create]

    def create
      Guest.first.update(options: @data)

      render json: { data: @data, guest_params: guest_params }
    end

    private

    def guest_params
      params.permit(:data)
    end

    def set_data
      @data = params
    end
  end
end
