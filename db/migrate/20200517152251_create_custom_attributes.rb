class CreateCustomAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_attributes do |t|
      t.string :name
      t.string :form_name
      t.string :attribute_type
      t.boolean :required, default: nil
      t.timestamps
    end
  end
end
