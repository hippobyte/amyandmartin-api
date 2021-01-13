#
# CreateRsvps
#
class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps, id: :text do |t|
      t.text :guest_id
      t.text :invite_code
      t.text :status
      t.integer :guest_count, default: 0
      t.integer :children_count, default: 0
      t.jsonb :options

      t.timestamps
    end
    add_index :rsvps, :guest_id
    add_index :rsvps, :status
    add_index :rsvps, :invite_code
  end
end
