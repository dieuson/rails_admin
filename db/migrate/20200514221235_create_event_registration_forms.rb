class CreateEventRegistrationForms < ActiveRecord::Migration[5.2]
  def up
    create_table :event_registration_forms do |t|
      t.references :user, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :event_registration_forms
  end
end
