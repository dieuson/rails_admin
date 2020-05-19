# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # return unless user&.admin?
    can :access, :rails_admin   # grant access to rails_admin
    can :read, :dashboard       # grant access to the dashboard
    can :manage, CustomAttribute

    # can :manage, :all
    # can :read, :all


    if user.admin?
      # can :manage, Event, visible: true
      # custom attribute optional/required

      can :manage, [User, Event]
      can %i[read update], [UserProfile, UserSignUpForm, EventRegistrationForm]
    else
      can :read, Event
      can %i[read update], UserProfile, user_id: user.id
      can %i[read update], [EventRegistrationForm, UserSignUpForm]
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
