# frozen_string_literal: true

module Types
  #
  # QueryType
  #
  class QueryType < Types::BaseObject
    field :rsvp, [RsvpType], null: true do
      argument :invite_code, String, required: true
    end

    def rsvp(invite_code: nil)
      Rsvp.invited.where(invite_code: invite_code)
    end
  end
end
