# frozen_string_literal: true

module Types
  #
  # GuestLookupType
  #
  class GuestLookupType < Types::BaseObject
    field :email, String, null: true
  end
end
