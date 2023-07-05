# Now you can have two restr. Controllers, one with HTML (at route of controller folder) and one inside api v1.
class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_restaurant, only: [ :show, :update ]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
  end

  def update
    if @restaurant.update(restaurant_params)
      render :show # Send back JSON so user knows they have updated
    else
      render_error
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id]) # For Show
    authorize @restaurant # For Pundit. Needs policy
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
