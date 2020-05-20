# frozen_string_literal: true

class UserProfile < ApplicationRecord
  extend FormBase
  belongs_to :user

  rails_admin do
    UserProfile.refresh_methods.each do |question|
      field question[:name].to_sym, question[:type].to_sym do
        formatted_value { bindings[:object].send(question[:name]) }
      end
    end
  end
end
