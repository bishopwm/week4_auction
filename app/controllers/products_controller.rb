class ProductsController < ApplicationController
	before_action :owner_only, except: [:index, :all, :show]

	def index
		@user = User.find(params[:user_id])
		@products = @user.products
		# @product = @user.products.new
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
		@product = Product.find(params[:id])
	end


	def destroy
		@user = User.find(params[:user_id])
		@product = Product.find_by(id: params[:id]).try(:destroy)
	end

	def all
		@all_products = Product.all
	end

	def edit
		@user = User.find(params[:user_id])
	    @products = @user.products
	    @product = Product.find(params[:id])

	end

	def update
	    @product = Product.find_by(id: params[:id])

	    if @product.update_attributes(product_params)
	      redirect_to product_path, notice: 'Product was successfully updated.'
	    else
	      render :edit
	    end
	end

	private

  	def product_params
    	params.require(:product).permit(:user_id, :title, :description, :deadline, :photo)
  	end

  	def owner_only
  		p params
  		p current_user
  		current_user = User.find(params[:user_id])
		if params[:user_id].to_i != current_user.id
			flash[:message] = "Not qualified"
			redirect_to login_path
		end
	end
end