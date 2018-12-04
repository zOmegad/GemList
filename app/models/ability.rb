class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud # Pour ne pas se répéter

    can [:read, :create], User # Seul les actions :index, :show sont accessible publiquement

    if user.id
      can [:read, :create], Post
    end

    if user.admin?
      can :manage, :all # L'administrateur peut tout modifier
    end
  end
end
