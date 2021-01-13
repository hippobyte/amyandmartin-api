# frozen_string_literal: true

#
# GuestContact
#
class GuestContact < ApplicationRecord
  belongs_to :guest

  has_paper_trail
end
