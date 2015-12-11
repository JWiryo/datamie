class Admin::UsersController < ApplicationController

  before_action :authorize

  def index
    @users = query_db("SELECT * FROM users")
  end

end
