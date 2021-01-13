class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests, id: :text do |t|
      t.text :first_name
      t.text :last_name
      t.text :guest_name
      t.integer :wave
      t.integer :children_count, default: 0
      t.integer :guest_count, default: 0
      t.jsonb :options

      t.timestamps
    end
  end
end
