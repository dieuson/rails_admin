# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :value
      t.references :custom_attribute, index: true
      t.references :formable, polymorphic: true
      t.timestamps
    end
  end
end
