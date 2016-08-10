module API
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :authenticate_token
    before_action :set_default_format

    skip_before_action :verify_authenticity_token

    protected

    # If you want to restrict access for guests
    # add this line to your controller:
    #     before_action :authenticate!
    def authenticate!
      render_unauthorized unless current_user
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @current_user = User.find_by(token: token)
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad credentials', status: 401
    end

    def set_default_format
      request.format = :json unless params[:format]
    end
  end
end
