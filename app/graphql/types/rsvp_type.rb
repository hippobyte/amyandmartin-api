# frozen_string_literal: true

module Types
  #
  # RsvpType
  #
  class RsvpType < Types::BaseObject
    field :id, ID, null: false
    field :guest, GuestType, null: true
    field :status, String, null: true
    field :guest_count, Integer, null: true
    field :kids_count, Integer, null: true
    field :preferences, BaseScalar, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
