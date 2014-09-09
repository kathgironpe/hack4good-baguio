class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order('last_name DESC')
  end
end
