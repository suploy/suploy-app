class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin? :admin
      can :manage, :all
    elsif user_signed_in
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
