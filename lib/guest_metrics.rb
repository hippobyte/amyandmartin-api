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
        email: email(guest.guest_contacts),
        adults: rsvp_adult_count(guest),
        children: rsvp_children_count(guest),
        total: rsvp_total_count(guest),
        rsvp_date: rsvp_date(guest.rsvp)
      }
    end
  end

  private

  def rsvp_adult_count(guest)
    return guest.guest_count.to_i + 1 unless guest.rsvp.confirmed?

    guest.rsvp.guest_count.to_i
  end

  def rsvp_children_count(guest)
    return guest.children_count.to_i unless guest.rsvp.confirmed?

    guest.rsvp.children_count.to_i
  end

  def rsvp_total_count(guest)
    rsvp_adult_count(guest) + rsvp_children_count(guest)
  end

  def rsvp_date(rsvp)
    return unless rsvp.confirmed?

    rsvp.updated_at.in_time_zone('America/Los_Angeles').strftime('%Y-%m-%d')
  end

  def email(guest_contacts)
    email = guest_contacts.map(&:email)
    return email.join(', ') if email.is_a?(Array)

    email
  end
end
