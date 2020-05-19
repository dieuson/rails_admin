# frozen_string_literal: true

class CreateUserSignUpForms < ActiveRecord::Migration[5.2]
  def up
    create_table :user_sign_up_forms, &:timestamps
  end

  def down
    drop_table :user_sign_up_forms
  end
end
