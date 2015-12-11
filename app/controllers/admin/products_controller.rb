class Admin::ProductsController < ApplicationController

  before_action :authorize

  def index
    @products = query_db("SELECT * FROM Products;")
  end

  def new
  end

  def create
  end

end
