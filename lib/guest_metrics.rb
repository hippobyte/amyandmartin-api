# frozen_string_literal: true

# GuestMetrics
class GuestMetrics
  class << self
    def summary
      new.summary
    end
  end

  def initialize
    @guests = Guest.all
  end

  def summary
    @guests.map do |guest|
      {
        response:   guest.rsvp.status,
        first_name: guest.first_name,
        last_name:  guest.last_name,
        email:      email(guest.guest_contacts),
        adults:     guest.rsvp.guest_count.to_i,
        children:   guest.rsvp.children_count.to_i,
        total:      guest.rsvp.guest_count.to_i + guest.rsvp.children_count.to_i
      }
    end
  end

  private

  def email(guest_contacts)
    email = guest_contacts.map(&:email)
    return email.join(', ') if email.is_a?(Array)

    email
  end
end
