# frozen_string_literal: true

#
# Guest
#
class Guest < ApplicationRecord
  has_one :rsvp, dependent: :destroy

  has_paper_trail

  after_create :create_rsvp

  private

  def create_rsvp
    Rsvp.new(
      guest_id: id,
      status: :pending
    ).save
  end
end
