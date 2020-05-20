class Event < ApplicationRecord
  extend FormBase
  has_many :event_registration_forms

  rails_admin do

    Event.refresh_methods.each do |question|
      field question[:name].to_sym, question[:type].to_sym do
        formatted_value { bindings[:object].send(question[:name]) }
      end
    end

  end
end