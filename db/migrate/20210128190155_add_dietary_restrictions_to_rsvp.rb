class AddDietaryRestrictionsToRsvp < ActiveRecord::Migration[6.1]
  def change
    add_column :rsvps, :dietary_restrictions, :text
  end
end
