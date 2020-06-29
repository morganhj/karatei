class CollectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
	true 
  end

  def show?
  	true
  end

  def update?
  	record.user == user
  end

  def edit?
  	update?
  end
end
