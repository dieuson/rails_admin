# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new({ :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :admin => true}).save
User.new({ :email => 'user@example.com', :password => 'password', :password_confirmation => 'password', :admin => false }).save
Event.new().save
EventRegistrationForm.new(event_id: Event.last.id, user_id: User.where(admin: false).last.id).save
Event.new().save

CustomAttribute.new(name: 'Nom', attribute_type: 'Text', form_name: 'UserProfile', required: true).save
CustomAttribute.new(name: 'Prenom', attribute_type: 'Text', form_name: 'UserProfile', required: true).save

CustomAttribute.new(name: 'Nom', attribute_type: 'Text', form_name: 'EventRegistrationForm', required: false).save
CustomAttribute.new(name: 'Prenom', attribute_type: 'Text', form_name: 'EventRegistrationForm', required: false).save
