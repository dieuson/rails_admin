custom_attributes = CustomAttribute.last(2)
answers = {'Nom' => 'Dieuson', 'Prenom' => 'Test'}

class FillForm < Mutations::Command
  required do
    model :user, class: User
    array :custom_attributes, class: CustomAttribute
    hash :answers
  end

  def execute

  end
end