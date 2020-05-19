class AddEventToEventRegistrationForms < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_registration_forms, :event, foreign_key: true
  end
end
