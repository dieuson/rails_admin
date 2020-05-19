# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def up
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :user_profiles
  end
end
