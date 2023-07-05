class Api::V1::CommentsController < Api::V1::BaseController
  def create
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.restaurant = @restaurant
    @comment.user = current_user
    authorize @comment
    if @comment.save
      render :show, status: :created # Send back JSON so user knows they have created
    else
      render_error
    end
  end
end
