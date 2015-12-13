class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper
  include DateHelper

  protected

  def query_db(querystr)
    @client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "datamie", :password => "")
    @result = @client.query(querystr)
	return @result
  end

  def authorize
    unless $is_admin
      flash[:error] = "unauthorized access"
      redirect_to root_path
      false
    end
  end

end
