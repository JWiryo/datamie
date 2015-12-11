class CartController < ApplicationController
	include OrdersessionHelper

  def index
		products_unfiltered = query_db("SELECT * FROM products ORDER BY Product_Name ASC;")
		@products = []
		products_unfiltered.each do |row|
			if orders_get_quantity(row["Product_ID"]) > 0
				@products << row
			end
		end
  end

end
