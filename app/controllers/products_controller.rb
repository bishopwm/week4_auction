class ProductsController < ApplicationController
	before_action :owner_only, except: [:index]

	def index
		@user = User.find(params[:user_id])
		@products = @user.products
		@product = @user.products.new
	end

	def new
		@user = User.find(params[:user_id])
		@product = @user.products.new

	end


	def create
		@user = User.find(params[:user_id])
		@product = @user.products.new(product_params)
		if @product.valid?
			@product.save
			redirect_to user_products_path(@user), notice: "Post was successfull!"
		else
			render :new
		end
	end

		def show
		#@user = User.find(params[:user_id])
		@product = Product.find(params[:id])
		
	end


	def destroy
		@user = User.find(params[:user_id])
		@product = Product.find_by(id: params[:id]).try(:destroy)
	end

	def all
		@all_products = Product.all

	end

	private

  	def product_params
    	params.require(:product).permit(:user_id, :title, :description, :deadline)
  	end

  	def owner_only
		if params[:user_id] != current_user.id
			flash[:message] = "Not qualified"
			redirect_to login_path
		end
	end
end