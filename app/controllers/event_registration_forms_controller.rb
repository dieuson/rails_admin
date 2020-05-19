class EventRegistrationFormsController < RailsAdmin::MainController
  load_and_authorize_resource :event
  load_and_authorize_resource :event_registration_form, :through => :event

  def create
    print("\n\n\n\n\nPARAMS ")
    ap params
    print("\n\n\n\n\n")
  end
end
