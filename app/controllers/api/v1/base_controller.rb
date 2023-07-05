class Api::V1::BaseController < ActionController::API
  include Pundit::Authorization # Include Pundit for authorization

  # Check pundit authorization after every action
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # When errors, don't want to send error page (it's html).
  # Only send JSON, so see the two private methods called here in the rescue.
  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
