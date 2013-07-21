class HomeController < ApplicationController
  def index
    @users = User.all
    @routes = Route.all
  end
end
