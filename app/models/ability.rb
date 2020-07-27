# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can :manage, Movie
      can :manage, MovieView
    else
      can :read, :all
    end
  end
end
