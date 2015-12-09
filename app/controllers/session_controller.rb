class SessionController < ApplicationController

	def new

	end

	def create
		@session_username = params[:session][:username]
		@session_password = params[:session][:password]
		@database_username = query_db("SELECT Username FROM Users WHERE Username = '" +@session_username.to_s + "' ; " ).each(:as => :array).join

		if !@database_username.nil?
			if authenticate(@database_username, @session_password)
				log_in @database_username
				#current_user @database_username
				#@current_user = current_user(@database_username)
				if logged_in?
					redirect_to products_path
					flash[:success] = "Hello #{@session_username}, you have successfully logged in."
				else
					flash.now[:danger] = "No login"
					render 'new'
				end
			else
				flash.now[:danger] = "Invalid. Try again."
				render 'new'
			end
		else
			flash.now[:danger] = "Invalid. Try again."
			render 'new'
		end

	end


	def authenticate(database_username, input_password)
		if !database_username.empty?
			@database_password = query_db("SELECT Password FROM users WHERE Username = '" + database_username.to_s + "' ; " ).each(:as => :array).join
			if @database_password == input_password
				return true
			else
				return false
			end
		else
			return false
		end

	end

	def destroy
		log_out
		redirect_to root_url
	end

end