class ProductsController < ApplicationController

  def index
    if params[:search_flavour].nil? && params[:search_qty].nil?
      @products = query_db("SELECT * FROM products")
    elsif params[:search_flavour].empty? && params[:search_qty].empty?
      @products = query_db("SELECT * FROM products")
    else
      if params[:search_flavour].empty?
        @qty = params[:search_qty]
        @products = query_db("SELECT * FROM products WHERE Stock_Qty > "+@qty.to_s+";")
      elsif params[:search_qty].empty?
        @flavour = params[:search_flavour]
        @products = query_db("SELECT * FROM products WHERE Product_Name LIKE '%"+@flavour.to_s+"%' AND Stock_Qty > 0;")
      else
        @flavour = params[:search_flavour]
        @qty = params[:search_qty]
        @products = query_db("SELECT * FROM products WHERE Product_Name LIKE '%"+@flavour.to_s+"%' AND Stock_Qty > "+@qty.to_s+";")
      end
    end
  end

  def show
    @products = query_db("SELECT * FROM products WHERE Product_ID = "+params[:id].to_s)

  	if @products.any?
  		@product = @products.first
  		@ratings = query_db(
      "SELECT * FROM (SELECT Rating_ID, AVG(score) AS Helpfulness_Score FROM Helpfulness
  										GROUP BY Rating_ID) A
  							      right outer join Ratings B
  							      on A.Rating_ID = B.Rating_ID
  							      WHERE B.Product_ID = "+params[:id].to_s+"
  							      Order By Helpfulness_Score DESC;")
  	else
  		redirect_to url_for(:controller => 'products', :action => 'index') and return
  	end
  end

end
