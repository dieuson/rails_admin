class UserSignUpForm < ApplicationRecord
  extend FormBase
  # include Form
  #
  #
  UserSignUpForm.refresh_methods.each do |question|
    field question[:name].to_sym, question[:type].to_sym do
      formatted_value { bindings[:object].send(question[:name]) }
    end
  end

end
