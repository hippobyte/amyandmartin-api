class CreateGuestContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :guest_contacts, id: :text do |t|
      t.text :guest_id
      t.text :email
      t.text :phone
      t.text :address

      t.timestamps
    end
  end
end
