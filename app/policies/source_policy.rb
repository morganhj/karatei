class SourcePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
  	return true    
  end

  def new?
  	create?
  end

  def destroy?
    true
  end
end
