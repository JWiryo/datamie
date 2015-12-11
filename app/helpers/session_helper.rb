module SessionHelper

	#login the given user
	def log_in(database_username)
		session[:username] = database_username
		$current_user = database_username
		session[:orders] = nil
	end

	# def current_user(database_username)
		# #@current_user ||= User.find_by(id: session[:username])
		# #@current_user = query_db("SELECT Username FROM Users WHERE Username = '" +session[:username] + "' ; " ).each(:as => :array).join
		# #@current_user = database_username
		# #@current_user = session[database_username]
		# send(:logged_in? , @current_user) #allow included classes to call private methods
		# return @current_user
	# end

	def logged_in?
		if !$current_user.nil?
			return true
		else
			return false
		end
	end

	def log_out
		#session.delete(:database_username)
		session[:username] = nil
		$current_user = nil
		session[:orders] = nil
	end

end
