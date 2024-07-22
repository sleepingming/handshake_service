class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  private

  def authenticate_admin!
    unless current_user&.admin?
      render json: { error: 'You are not authorized to access this page.' }, status: :forbidden
    end
  end
end
