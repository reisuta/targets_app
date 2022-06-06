class ApplicationController < ActionController::Base
  before_action :authenticate!

  private
    def authenticate!
      redirect_to login_url unless user_signed_in?
    end
end
