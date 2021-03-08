# frozen_string_literal: true

module Api
  # GuestController
  class GuestController < ApiController
    before_action :set_payload, only: [:webhook]

    def webhook
      return create_guest_on_webhook if create?
      return update_guest_on_webhook if update?

      render json: { status: :unprocessable_entity }, status: :unprocessable_entity
    end

    private

    def create_guest_on_webhook
      return respond_on_success if Guest.create(@data)

      respond_on_failure
    end

    def update_guest_on_webhook
      guest = Guest.find(@data[:id])
      return respond_on_success if guest.update(@data.except(:id))

      respond_on_failure
    end

    def guest_params
      params.permit(:UpdateMode, Data: {})
    end

    def set_payload
      @payload = guest_params
      @data = guest_params[:Data]
    end

    def update?
      @payload[:UpdateMode] == 'Update'
    end

    def create?
      @payload[:UpdateMode] == 'Create'
    end

    def respond_on_success
      render json: { status: :accepted }, status: :accepted
    end

    def respond_on_failure
      render json: { status: :unprocessable_entity }, status: :unprocessable_entity
    end
  end
end
