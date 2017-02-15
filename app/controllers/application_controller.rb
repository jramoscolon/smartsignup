class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def logged_in?
    # "!!" converts the "current_user" variable to a boolean (exists or doesn't)
    !!current_user
  end
end
