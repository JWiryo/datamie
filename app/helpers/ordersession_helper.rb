require 'ostruct'

module OrdersessionHelper

	def orders_get_quantity(product_id)
		if !$current_user.nil?
			if !session[:orders].nil?
				session[:orders].each do |order|
					if (order["table"]["product_id"]==product_id)
						return order["table"]["quantity"]
					end
				end
			end
			return 0 #show add to cart
		end
		return -1
	end

end
