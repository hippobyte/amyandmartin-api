# frozen_string_literal: true

module Types
  #
  # QueryType
  #
  class QueryType < Types::BaseObject
    field :rsvp, RsvpType, null: true do
      argument :invite_code, String, required: true
    end

    field :reset_by_email, GuestLookupType, null: true do
      argument :email, String, required: true
    end

    def rsvp(invite_code: nil)
      Rsvp.active.find_by(invite_code: invite_code)
    end

    def reset_by_email(email: nil)
      guest = GuestContact.find_by(email: email).guest

      if guest.present?
        guest.email
        return guest
      end

      return nil
    end
  end
end
