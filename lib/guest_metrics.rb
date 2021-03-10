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
        response: guest.rsvp.status,
        first_name: guest.first_name,
        last_name: guest.last_name,
        email: email(guest.guest_contacts)
      }.merge(counts(guest.rsvp))
    end
  end

  private

  def counts(rsvp)
    if rsvp.confirmed?
      return {
        adults: rsvp.guest_count.to_i,
        children: rsvp.children_count.to_i,
        total: rsvp.guest_count.to_i + rsvp.children_count.to_i
      }
    end

    { adults: 0, children: 0, total: 0 }
  end

  def email(guest_contacts)
    email = guest_contacts.map(&:email)
    return email.join(', ') if email.is_a?(Array)

    email
  end
end
