module FormBase

  def custom_attributes
    CustomAttribute.where(form_name: name)
  end

  def add_custom_attribute(label, type = 'Text')
    CustomAttribute.create(label: label, question_type: type, form_name: name)
  end

  def questions
    CustomAttribute.where(form_name: 'EventRegistrationForm')
  end

  def add_question(label, type = 'Text')
    CustomAttribute.create(label: label, question_type: type, form_name: name)
  end

  def refresh_methods
    labels = []
    CustomAttribute.where(form_name: name).each do |question|
      label = question.name
      validates_presence_of label if question.required == true

      define_method(label) do
      end
      labels << label
    end
    labels
  end

end
