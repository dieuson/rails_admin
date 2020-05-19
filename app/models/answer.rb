# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :custom_attribute
  # validate :value, presence: custom_attribute.required == true
end
