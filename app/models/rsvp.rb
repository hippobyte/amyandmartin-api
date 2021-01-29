# frozen_string_literal: true

#
# Rsvp
#
class Rsvp < ApplicationRecord
  belongs_to :guest

  enum status: {
    pending: 'pending', invited: 'invited', confirmed: 'confirmed', declined: 'declined'
  }

  has_paper_trail

  after_initialize do
    self.options ||= {}
  end

  scope :active, -> { where(status: %i[invited confirmed declined]) }
end
