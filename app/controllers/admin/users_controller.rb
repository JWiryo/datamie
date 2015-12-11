class Admin::UsersController < ApplicationController

  def index
    @client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "datamie", :password => "")
    @users = @client.query("SELECT * FROM users")
  end

  def show
  end

end
