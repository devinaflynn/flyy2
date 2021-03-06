class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_apps

  private

  def get_apps
    if user_signed_in?
      @user_apps = current_user.apps
    end
  end
end
