class UserProfile < ApplicationRecord
  extend FormBase
  belongs_to :user

  rails_admin do

    UserProfile.refresh_methods.each do |question|
      field question.to_sym do
        formatted_value { bindings[:object].send(question) }
      end
    end
  end
end
