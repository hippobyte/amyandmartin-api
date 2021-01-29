# frozen_string_literal: true

module Types
  #
  # RsvpType
  #
  class RsvpType < Types::BaseObject
    field :id, ID, null: false
    field :guest, GuestType, null: true
    field :invite_code, String, null: false
    field :status, String, null: true
    field :partner_status, String, null: true
    field :partner_name, String, null: true
    field :dietary_restrictions, String, null: true
    field :child_status, String, null: true
    field :guest_count, Integer, null: true
    field :children_count, Integer, null: true
    field :total_rsvp_count, Integer, null: true
    field :options, BaseScalar, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def total_rsvp_count
      guest_count.to_i + children_count.to_i
    end
  end
end
