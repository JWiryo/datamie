class SessionController < ApplicationController

	before_action :update_admin_status, only: [:create]

	def new
	end

	def create
		if authenticate(@database_username, @session_password) && !$is_admin
			log_in @database_username
			redirect_to products_path
			flash[:success] = "Hello #{@session_username}, you have successfully logged in."
		elsif authenticate(@database_username, @session_password) && $is_admin
			log_in @database_username
			redirect_to admin_dashboard_index_path
			flash[:success] = "Hello #{@session_username}, you have successfully logged in as admin."
		else
			flash.now[:danger] = "Invalid username or password. Try again."
			render 'new'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end

	private
	def authenticate(database_username, input_password)
		if !database_username.empty?
			@database_password = query_db("SELECT Password FROM users WHERE Username = '" + database_username.to_s + "' ; " ).first["Password"]
			return true if @database_password == input_password
		else
			return false
		end
	end

	def update_admin_status
		@session_username = params[:session][:username]
		@session_password = params[:session][:password]
		@database_username = query_db("SELECT Username FROM Users WHERE Username = '" +@session_username.to_s + "' ; " ).each(:as => :array).join
		@check_admin = query_db("SELECT Is_Admin FROM Users WHERE Username = '" +@session_username.to_s + "' ; " ).each(:as => :array).join
		$is_admin = true if @check_admin=="1"
	end

end
