class ProductsController < ApplicationController

  def index
    @client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "root", :password => "")
    @products = @client.query("SELECT * FROM products")
  end

end
