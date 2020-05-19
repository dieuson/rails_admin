# frozen_string_literal: true

class CustomAttribute < ApplicationRecord
  TEXT_ATTRIBUTE_TYPE = 'TEXT'
  BOOLEAN_ATTRIBUTE_TYPE = 'BOOLEAN'

  def boolean?(value)
    value.is_a?(TrueClass) || value.is_a?(FalseClass)
  end

  def fill(value, user)
    raise 'Required field empty' if required && (value.nil? || value.blank?)

    if attribute_type == BOOLEAN_ATTRIBUTE_TYPE && !boolean?(value)
      raise 'Invalid attribute type'
    end

    form = form_name.constantize.where(user_id: user.id).first_or_create
    answer = Answer.where(custom_attribute: self, formable_id: form.id, formable_type: form.class.name).first_or_create
    answer.update(value: value)
  end
end
