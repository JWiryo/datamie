module SessionHelper

	#login the given user
	def log_in(database_username)
		session[:username] = database_username
		current_user(database_username)
	end

	def current_user(database_username)
		#@current_user ||= User.find_by(id: session[:username])
		@current_user = database_username
		#@current_user = session[database_username]
		#return @current_user
		send(:logged_in? , @current_user)
	end

	def logged_in?(current_user)
		#puts "TEST"
    	if !@current_user.nil?
    		return true
    	else
    		return false
    	end
  	end

end
