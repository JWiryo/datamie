class OrdersessionController < ApplicationController

	before_action :initialize_session
	
	#remote controller should only return once
	def orders_add
		@product_id = params[:product_id].to_i
		@quantity = params[:quantity].to_i
		
		found = false
		session[:orders].each do |order|
			if (order["table"]["product_id"]==@product_id and not found) #session-ized variable uses [table]
				respond_to do |format|
					format.json { render json: { error: "Product already ordered. Please check your cart."} }
				end
				found = true
				return
			end
		end
		
		if (not found)
			if (@quantity>0)
				neworder = OpenStruct.new product_id: @product_id, quantity: @quantity
				session[:orders] << neworder
				
				respond_to do |format| #success
					format.json { render json: {} }
				end
			else
				respond_to do |format|
					format.json { render json: { error: "Invalid quantity to be added to cart."} }
				end
			end
		end
		return nil
	end

	def orders_remove
		@product_id = params[:product_id].to_i
		
		found = false
		session[:orders].each do |order|
			if (order["table"]["product_id"]==@product_id and not found)
				session[:orders].delete_at(session[:orders].index(order))
				respond_to do |format| #success
					format.json { render json: {} }
				end
				found = true
				return
			end
		end

		respond_to do |format|
			format.json { render json: { error: "Product not in cart. Please refresh page and try again."} }
		end
		return
	end
	
	def orders_update
		@product_id = params[:product_id].to_i
		@quantity = params[:quantity].to_i
		
		found = false
		session[:orders].each do |order|
			if (order["table"]["product_id"]==@product_id)
				if (@quantity < 1)
					session[:orders].delete_at(session[:orders].index(order))
					respond_to do |format|
						format.json { render json: { error: "Warning: Invalid value causes item to be removed from cart."} }
					end
				else
					order["table"]["quantity"] = @quantity
					respond_to do |format| #success
						format.json { render json: {} }
					end
				end
				found = true
				return
			end
		end

		respond_to do |format|
			format.json { render json: { error: "Product not in cart. Please refresh page and try again."} }
		end
		return
	end
	
	private
	def initialize_session
		if session[:orders].nil?
			session[:orders] = []
		end
	end

end
