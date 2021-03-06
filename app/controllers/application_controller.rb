class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_new_product


helper_method :current_user
	def current_user
		if @current_user.nil?
			@current_user = User.find_by_id(session[:user_id])
		end
		@current_user
	end

	def set_new_product
		if current_user
			@new_product = current_user.products.new
		end
	end

	def authorize_user
		unless current_user
			flash[:message] = 'Please log in.'
			redirect_to login_path
		end
	end
end
