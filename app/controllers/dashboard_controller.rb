class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all.excludes(:id => current_user.id)
  end
end
