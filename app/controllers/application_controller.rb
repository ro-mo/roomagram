class ApplicationController < ActionController::Base
  before_action :set_current_request_details
  before_action :set_session
  before_action :authenticate

  private
    def set_session
      Current.session = Session.find_by_id(cookies.signed[:session_token])
    end

    def authenticate
      redirect_to sign_in_path unless Current.session
    end

    def set_current_request_details
      Current.user_agent = request.user_agent
      Current.ip_address = request.ip
    end
end
