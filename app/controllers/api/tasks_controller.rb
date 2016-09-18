class Api::TasksController < ActionController::Base
  before_action :authenticate_api_user!

  def index
    render :text => current_user.email
  end
end