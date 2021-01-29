class AddPartnerAndChildStatusToRsvp < ActiveRecord::Migration[6.1]
  def change
    add_column :rsvps, :partner_status, :text
    add_column :rsvps, :child_status, :text
  end
end
