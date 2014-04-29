class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user
      #SshKeys
      can :read, SshKey do |k|
        k && k.user == user
      end
      can :create, SshKey do |k|
        k && k.user == user
      end
      can :destroy, SshKey do |k|
        k && k.user == user
      end

      #Apps
      can :read, App do |a|
        a && a.user == user
      end
      can :create, App do |a|
        a && a.user == user
      end
      can :update, App do |a|
        a && a.user == user
      end
      can :destroy, App do |a|
        a && a.user == user
      end
    end
  end
end
