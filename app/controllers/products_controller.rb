class ProductsController < ApplicationController

  before_action :prepare_sort, only: [:index]

  def index
    if params[:search_flavour].nil? && params[:search_qty].nil?
      @products = query_db(@sort.to_s)
    elsif params[:search_flavour].empty? && params[:search_qty].empty?
      @products = query_db(@sort.to_s)
    else
      if params[:search_flavour].empty?
        @qty = params[:search_qty]
        @products = query_db("SELECT * FROM products WHERE Stock_Qty > "+@qty.to_s+" "+@sort.to_s+";")
      elsif params[:search_qty].empty?
        @flavour = params[:search_flavour]
        @products = query_db("SELECT * FROM products WHERE Product_Name LIKE '%"+@flavour.to_s+"%' AND Stock_Qty > 0 "+@sort.to_s+";")
      else
        @flavour = params[:search_flavour]
        @qty = params[:search_qty]
        @products = query_db("SELECT * FROM products WHERE Product_Name LIKE '%"+@flavour.to_s+"%' AND Stock_Qty > "+@qty.to_s+ " "+@sort.to_s+";")
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

  private

  def prepare_sort
    @sort = "SELECT * FROM products;" if params[:sort].nil?
    @sort = "SELECT * FROM products ORDER BY Product_Name ASC;" if params[:sort]=="AtoZ"
    @sort = "SELECT * FROM products ORDER BY Stock_Qty DESC;" if params[:sort]=="stock"
    @sort = "ORDER BY Price ASC" if params[:sort]=="priceASC"
    @sort = "ORDER BY Price DESC" if params[:sort]=="priceDESC"
  end

end
