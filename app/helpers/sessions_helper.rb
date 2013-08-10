module SessionsHelper
	# Some functions also need on others controller 
	# So it should define in Helper
	
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = {value: remember_token, expires: 20.years.from_now.utc}
		user.update_attribute(:remember_token,User.encrypt(remember_token))
		self.current_user = user
	end


	#define method Signed_in??? #if current_user not nil
	def signed_in?
		!current_user.nil?
	end


	def current_user=(user)
		@current_user= user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by_remember_token(remember_token)
	end


	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

end
