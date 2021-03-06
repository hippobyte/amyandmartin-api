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
      rsvp = Rsvp.active.find_by(invite_code: invite_code)

      if rsvp.present?
        rsvp.guest.paper_trail_event = 'login'
        rsvp.guest.touch
      end

      return rsvp
    end

    def reset_by_email(email: nil)
      contact = GuestContact.find_by(email: email)

      if contact.present? && contact.guest.present?
        NotificationMailer.invite_code(
          email: contact.email, code: contact.guest.rsvp.invite_code
        ).deliver

        return contact
      end

      return nil
    end
  end
end
