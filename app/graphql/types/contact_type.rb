# frozen_string_literal: true

module Types
  #
  # ContactType
  #
  class ContactType < Types::BaseObject
    field :email, String, null: true
    field :phone, String, null: true
    field :address, String, null: true
  end
end
