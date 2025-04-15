class UserPolicy < ApplicationPolicy
  def index?
    user.role == "Admin"
  end

  def show?
    user.role == "Admin" || record.id == user.id
  end

  class Scope < Scope
    def resolve
      if user.role == "Admin"
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
