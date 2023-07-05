# require 'pry-byebug'

class Api::V1::CommentsController < Api::V1::BaseController
  # before_action :set_restaurant, only: [ :create ]
  acts_as_token_authentication_handler_for User # Required to use comment policy

  def create
    @restaurant = Restaurant.find(params[:id]) # For Show
    @comment = Comment.new(comment_params)
    @comment.restaurant = @restaurant
    @comment.user = @restaurant.user
    # binding.pry
    authorize @comment # For Pundit. Needs policy
    if @comment.save
      render json: @restaurant.comments, status: :created, location: api_v1_restaurant_url(@restaurant)
    else
      render_error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id]) # For Show
  #   authorize @restaurant # For Pundit. Needs policy
  # end

  def render_error
    render json: { errors: @comment.errors.full_messages },
      status: :unprocessable_entity
  end

end


# curl -i -X POST                                                              \
#      -H 'Content-Type: application/json'                                     \
#      -H 'X-User-Email: scott@lewagon'                                      \
#      -H 'X-User-Token: CkrCtBQzxyADLPF4dys_'                                 \
#      -d '{ "comment": {"content":"Great" } }' \
#      http://localhost:3000/api/v1/restaurants/3/comments
