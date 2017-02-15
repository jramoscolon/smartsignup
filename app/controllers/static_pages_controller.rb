class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
  	redirect_to registros_path if logged_in?
  end
end
