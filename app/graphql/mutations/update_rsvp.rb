# frozen_string_literal: true

module Mutations
  #
  # UpdateRsvp
  #
  class UpdateRsvp < Mutations::BaseMutation
    argument :id,                   ID,               required: true
    argument :status,               String,           required: true
    argument :partner_status,       String,           required: false
    argument :partner_name,         String,           required: false
    argument :child_status,         String,           required: false
    argument :children,             Types::BaseJson,  required: false
    argument :dietary_restrictions, String,           required: false

    field :errors, String, null: false
    field :rsvp,   Types::RsvpType, null: true

    def resolve(attrs)
      params = rsvp_params(attrs)
      rsvp = Rsvp.find(params[:id])
      return { rsvp: rsvp, errors: [] } if rsvp.update(params) && rsvp.guest.update(guest_name: attrs[:partner_name])

      return { rsvp: nil, errors: rsvp.errors.full_messages }
    end

    def rsvp_params(**attrs)
      children = rsvp_children(attrs)
      guestcnt = rsvp_guest_count(attrs)

      attrs.to_h.except(:children, :partner_name).merge(
        partner_status: attrs[:partner_status] == 'pending  ' ? :declined : attrs[:partner_status],
        child_status: children.try(:size).to_i.positive? ? :confirmed : :declined,
        guest_count: guestcnt,
        children_count: children.try(:size).to_i,
        options: {
          children: children
        }
      )
    end

    def rsvp_children(attrs)
      value = attrs[:children]
      return [] if value.blank?

      value.try(:map, &:values).try(:flatten) || []
    end

    def rsvp_guest_count(attrs)
      count  = 0
      count += 1 if attrs[:status] == 'confirmed'
      count += 1 if attrs[:partner_status] == 'confirmed'

      return count
    end
  end
end
