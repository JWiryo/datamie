class SessionController < ApplicationController

	def new
	end

	#nama function = nama view

	def authenticate
		@client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "datamie", :password => "")
		@session_username = params[:userdata][:Data_Username]
		@session_password = params[:userdata][:Data_Password] 
		#@LoginPassword = query_db("SELECT Password FROM users WHERE Username = " + @session_username.to_s + " ; " )
		@LoginPassword = query_db("SELECT Password FROM users WHERE Username = '" + params[:userdata][:Data_Username].to_s + "' ; " ).each(:as => :array).join

		if @LoginPassword == @session_password
			redirect_to '/success'
		else
			redirect_to '/authenticate'
		end
 
	end

	def success
	end

	def fail
	end

end
