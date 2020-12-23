# frozen_string_literal: true

#
# ApplicationRecord
#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Callbacks
  before_create :set_nanoid

  private

  def set_nanoid
    self.id = SecureRandom.nanoid if id.nil?
  end
end
