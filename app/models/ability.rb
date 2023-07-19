class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (if no user is logged in)

    can :read, Category, author_id: user.id
    can :read, Entity, author_id: user.id
    can :destroy, Category, author_id: user.id
    can :destroy, Entity, author_id: user.id
  end
end
