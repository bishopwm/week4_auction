class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_username(params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/products/all'
		else
			redirect_to '/login', notice: "Incorrect Username or Password"
		end
	end

	def destroy
		session.clear
		redirect_to '/'
	end

end
