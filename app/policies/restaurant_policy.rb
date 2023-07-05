class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # Allows all users to see all restaurants in scope (index)
    def resolve
      scope.all
    end
  end

  def show?
    true # All users can see a restaurant
  end

  # Only the owner of the restaurant can update it
  # record is the restaurant, user is the current_user
  def update?
    record.user == user
  end

  def create?
    # Any logged in user can create a restaurant
    !user.nil? # User is not nil
  end

  def destroy?
    # Only the owner of the restaurant can delete it
    record.user == user
  end
end
