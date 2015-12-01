class ProductsController < ApplicationController

  def index
    @products = query_db("SELECT * FROM products WHERE Product_ID<6")
  end

end
