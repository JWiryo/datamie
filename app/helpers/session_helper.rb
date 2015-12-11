module SessionHelper

	#login the given user
	def log_in(database_username)
		session[:username] = database_username
		$current_user = database_username
	end

	def logged_in?
		if !$current_user.nil?
			return true
		else
			return false
		end
	end

	def log_out
		session.delete(:database_username)
		$current_user = nil
		$is_admin = false
	end

end
