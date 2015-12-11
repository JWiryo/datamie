class CartController < ApplicationController
	include OrdersessionHelper

  def index
		if !$current_user.nil?
			products_unfiltered = query_db("SELECT * FROM products ORDER BY Product_Name ASC;")
			@products = []
			products_unfiltered.each do |row|
				if orders_get_quantity(row["Product_ID"]) > 0
					@products << row
				end
			end
		else
			#prevent user from accessing forbidden areas if not logged in
			redirect_to url_for(:controller => 'products', :action => 'index')
		end
  end
	
	def submit
		if !$current_user.nil?
			if !session[:orders].nil?
				if session[:orders].any?
					begin
						next_id = query_db("SHOW TABLE STATUS LIKE 'orders';").first["Auto_increment"].to_s
						orderitemquery = "INSERT INTO order_items (Order_ID,Product_ID,Quantity) VALUES "
						_orderitemlist = []
						session[:orders].each do |order|
							_orderitemlist << '('+next_id+','+order["table"]["product_id"].to_s+','+order["table"]["quantity"].to_s+')'
						end
						orderitemquery += _orderitemlist.join(', ') + ';'
						
						username = $current_user.to_s

						orderquery = "INSERT INTO orders (Order_ID,Username,Order_Date,Order_Status)
										select "+next_id+" as Order_ID,'"
						orderquery += username+"' as Username,'"
						orderquery += Time.now.strftime("%Y-%m-%d %H:%M:%S")+"' as Order_Date, 'Pending' as Order_Status;"

						query_db(orderquery.to_s)
						begin
							query_db(orderitemquery.to_s)
						rescue Exception => e
							query_db("DELETE FROM orders WHERE Order_Id="+next_id) #clean up
							redirect_to :back
							flash[:danger] = e.message
							return
							#raise e
						end
						session[:orders] = nil #clean session
						redirect_to url_for(:controller => 'products', :action => 'index')
						flash[:success] = "Submitted Order #"+next_id+" successfully."
					rescue Exception => e
						redirect_to :back
						flash[:danger] = e.message
						return
					end
				else
					redirect_to :back
					flash[:danger] = "Cart is Empty."
					return
				end
			else
				redirect_to :back
				flash[:danger] = "Cart is Empty."
				return
			end
		else
			redirect_to :back
			flash[:danger] = "Please login to submit order."
			return
		end
	end

end
