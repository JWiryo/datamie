class ProductsController < ApplicationController

  def index
    @products = query_db("SELECT * FROM products")
  end
  
  def show
	@products = query_db("SELECT * FROM products WHERE Product_ID = "+params[:id].to_s)
	if @products.any?
		@product = @products.first
		@ratings = query_db("SELECT * FROM (SELECT Rating_ID, AVG(score) AS Helpfulness_Score FROM Helpfulness
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
