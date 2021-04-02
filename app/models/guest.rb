# frozen_string_literal: true

#
# Guest
#
class Guest < ApplicationRecord
  has_one :rsvp, dependent: :destroy
  has_many :guest_contacts, dependent: :destroy

  has_paper_trail

  after_create :create_rsvp

  class << self
  end

  def invite_url
    "https://www.amyandmartin.com?invitecode=#{rsvp.invite_code}"
  end

  private

  def create_rsvp
    Rsvp.new(
      guest_id: id,
      status: :pending,
      partner_status: :pending,
      child_status: :pending,
      invite_code: invite_code
    ).save
  end

  def invite_code
    code = SecureRandom.nanoid(size: 8, alphabet: '0123456789')
    raise StandardError, 'Duplicate code, retry pending.' if Rsvp.find_by(invite_code: code).present?

    return code
  rescue StandardError => e
    Rails.logger.error(e)
    retry
  end
end
