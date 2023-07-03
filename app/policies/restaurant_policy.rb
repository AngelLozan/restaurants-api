class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # Allows all users to see all restaurants in scope (index)
    def resolve
      scope.all
    end
  end
end
