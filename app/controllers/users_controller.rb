class UsersController < ApplicationController
	before_action :authorize_user, except: [:home, :new, :create]

	def index
		@user = User.last_created(20)
	end

	def show
		@user = User.find(params[:id]) ||
			render_404(params)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
		end
		redirect_to '/users/'
	end

	def destroy
		@user = User.all.destroy
	end


private

	def user_params
		params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
	end


end





