# Now you can have two restr. Controllers, one with HTML (at route of controller folder) and one inside api v1.
class Api::V1::RestaurantsController < Api::V1::BaseController
before_action :set_restaurant, only: [ :show ]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant # For Pundit
  end

end
