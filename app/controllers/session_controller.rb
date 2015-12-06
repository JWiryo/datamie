class SessionController < ApplicationController

	def new
	end

	def create
		@session_username = params[:session][:username]
		@session_password = params[:session][:password]
		@database_username = query_db("SELECT Username FROM Users WHERE Username = '" +@session_username.to_s + "' ; " ).each(:as => :array).join

		if !@database_username.nil?
			if authenticate(@database_username, @session_password)
				redirect_to products_path
				flash[:success] = "Hello #{@session_username}, you have successfully logged in."
			else
				flash.now[:danger] = "Invalid. Try again."
				render 'new'
			end
		else
			flash.now[:danger] = "Invalid. Try again."
			render 'new'
		end

	end

	private

	def authenticate(database_username, input_password)
		@database_password = query_db("SELECT Password FROM users WHERE Username = '" + database_username.to_s + "' ; " ).each(:as => :array).join
		if @database_password == input_password
			return true
		else
			return false
		end

	end

end
