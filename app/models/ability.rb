class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :manage, Book do |book|
      book.try(:user) == user
    end
  end
end
