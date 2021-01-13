# frozen_string_literal: true

module Types
  #
  # GuestType
  #
  class GuestType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :guest_name, String, null: true
    field :children_count, Integer, null: false
    field :guest_count, Integer, null: false
    field :contact, [ContactType], null: true
    field :rsvp, RsvpType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def contact
      object.guest_contacts
    end
  end
end
