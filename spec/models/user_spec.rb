# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_admin) { User.new(admin: true) }
  let(:user) { User.new(admin: false) }
  let(:user_profile) { UserProfile.new(user_id: user.id) }
  let(:user_signup_form) { UserSignUpForm.new }
  let(:event_registration_form) { EventRegistrationForm.new(event: event) }
  let(:event) { Event.new }
  let(:ability) { Ability.new(user_admin) }

  describe 'admin abilities' do
    it 'Admin manages the global User custom attributes' do
      expect(ability.can?(:manage, user)).to be_truthy
    end

    it 'Admin manages a specific Event’s custom attributes' do
      expect(ability.can?(:manage, event)).to be_truthy
    end

    it 'Admin makes a custom attribute optional/required on the User profile' do
      expect(ability.can?(:update, user_profile)).to be_truthy
    end

    it 'Admin makes a custom attribute optional/required on the User signup form' do
      expect(ability.can?(:update, user_signup_form)).to be_truthy
    end

    it 'Admin makes a custom attribute optional/required on a specific Event Registration form' do
      expect(ability.can?(:update, event_registration_form)).to be_truthy
    end

    it 'Admin reads an Event registration’s custom attributes' do
      expect(ability.can?(:manage, user)).to be_truthy
    end
  end

  describe 'classique abilities' do
    it 'User fills in a custom attribute on his profile' do
      expect(ability.can?(:update, user, user_id: user.id)).to be_truthy
    end

    it 'User fills in a custom attribute on the signup form' do
      expect(ability.can?(:update, user_signup_form)).to be_truthy
    end

    it 'User fills in a custom attribute on an Event Registration form' do
      expect(ability.can?(:read, user, user_id: user.id)).to be_truthy
    end
  end

end
