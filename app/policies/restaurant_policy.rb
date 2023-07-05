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
end
