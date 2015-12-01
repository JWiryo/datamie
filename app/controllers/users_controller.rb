class UsersController < ApplicationController

  def index
    @client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "root", :password => "")
    @users = @client.query("SELECT * FROM users")
  end

end
