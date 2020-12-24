#
# CreateRsvps
#
class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps, id: :text do |t|
      t.text :guest_id
      t.text :invite_code
      t.text :status
      t.boolean :with_guest
      t.boolean :with_kids
      t.integer :guest_count, default: 0
      t.integer :kids_count, default: 0
      t.jsonb :preferences

      t.timestamps
    end
    add_index :rsvps, :status
    add_index :rsvps, :invite_code
  end
end
