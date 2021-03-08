# frozen_string_literal: true

module Api
  # GuestController
  class GuestController < ApiController
    before_action :set_data, only: [:create]

    def create
      Guest.first.update(options: @data)
    end

    private

    def guest_params
      params.permit(data: {})
    end

    def set_data
      @data = guest_params[:data]
    end
  end
end