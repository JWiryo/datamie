class Admin::UsersController < ApplicationController

  before_action :authorize

  def index
    @users = query_db("SELECT * FROM users")
  end

  def show
    # redirect_to url_for(:controller => 'users', :action => 'show', :id => 1)
  end

end
