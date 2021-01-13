# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

guests = [
  {
    first_name: 'Martin',
    last_name: 'Marzejon',
    guest_name: 'Amy Che',
    children_count: 1,
    guest_count: 1,
    email: 'martinmarzejon@gmail.com',
    invited: true,
    invite_code: '04011979'
  },
  {
    first_name: 'Amy',
    last_name: 'Che',
    guest_name: nil,
    children_count: 0,
    guest_count: 0,
    email: 'amyche@gmail.com, martinmarzejon@hippobyte.com',
    address: '3637 Albion Pl N, 109, Seattle WA 98103',
    invited: true,
    invite_code: '02011980'
  }
]

guests.each do |item|
  # GUESTs
  guest_attributes = %i[first_name last_name guest_name children_count guest_count]
  guest = Guest.new(item.slice(*guest_attributes))
  guest.save

  # RSVPs
  rsvp_params = {}

  rsvp_params[:status] = :invited if item[:invited]
  rsvp_params[:invite_code] = item[:invite_code] if item[:invite_code]

  Rsvp.find_by(guest_id: guest.id).update(rsvp_params) if rsvp_params.present?

  # GUEST CONTACT
  contact_attrubutes = %i[address phone]
  list = item[:email].to_s.delete(' ').split(',')
  contact_params = item.slice(*contact_attrubutes)

  list.each do |email|
    GuestContact.create(contact_params.merge(guest_id: guest.id, email: email))
  end
end
