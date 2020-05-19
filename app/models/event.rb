class Event < ApplicationRecord
  extend FormBase
  has_many :event_registration_forms

  rails_admin do

    Event.refresh_methods.each do |question|
      field question.to_sym do
        formatted_value { bindings[:object].send(question) }
      end
    end
  end
end