# frozen_string_literal: true

module FormBase
  def custom_attributes
    CustomAttribute.where(form_name: name)
  end

  def add_custom_attribute(label, type = 'Text')
    CustomAttribute.create(label: label, question_type: type, form_name: name)
  end

  def questions
    CustomAttribute.where(form_name: name)
  end

  def add_question(label, type = 'Text')
    CustomAttribute.create(label: label, question_type: type, form_name: name)
  end

  def refresh_methods
    labels = []
    questions.each do |question|
      label = question.name
      validates_presence_of label if question.required == true

      define_method(label) do
      end

      attribute_type = if question.attribute_type == 'TEXT'
                         'string'
                       else
                         'boolean'
      end
      labels << { name: label, type: attribute_type }
    end
    labels
  end
end
