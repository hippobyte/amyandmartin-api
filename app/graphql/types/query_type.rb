# frozen_string_literal: true

module Types
  #
  # QueryType
  #
  class QueryType < Types::BaseObject
    field :rsvp, [RsvpType], null: true do
      argument :last_name, String, required: false
      argument :email, String, required: false
    end

    def rsvp(last_name: nil, email: nil)
      return Rsvp.invited.where(guest_id: Guest.where('last_name ilike ?', last_name).ids) if last_name.present?
      return Rsvp.invited.where(guest_id: Guest.where('email ilike ?', email).ids)         if email.present?
    end
  end
end
