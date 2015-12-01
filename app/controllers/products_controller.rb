class ProductsController < ApplicationController

  def index
    @products = query_db("SELECT * FROM products")
  end

end
