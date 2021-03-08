# frozen_string_literal: true

module Api
  # GuestController
  class GuestController < ApiController
    def create
      Guest.first.update(options: params)
    end
  end
end