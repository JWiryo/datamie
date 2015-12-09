class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  protected
  def query_db(querystr)
    @client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "datamie", :password => "")
    @result = @client.query(querystr)
	return @result
  end
end
