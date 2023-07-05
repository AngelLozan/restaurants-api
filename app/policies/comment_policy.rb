class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    !user.nil? # User is not nil
    # record.user == user # User is the owner of this comment
  end
end
