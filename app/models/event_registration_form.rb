# frozen_string_literal: true

class EventRegistrationForm < ApplicationRecord
  belongs_to :event
  extend FormBase

  def initialize(attributes = nil)
    print("attributes")
    ap attributes
    print("Done")
    super
  end

  rails_admin do
    field :event

    EventRegistrationForm.refresh_methods.each do |question|
      field question.to_sym do
        formatted_value { bindings[:object].send(question) }
      end
    end
  end
end
