class ProductsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@products = @user.products
		@product = @user.products.new
	end

	def new
		@user = User.find(params[:user_id])
		@product = @user.products.new

	end

	def show
		@product = Product.find(params[:user_id]) ||
		render_404(params)
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

	def destroy
		@user = User.find(params[:user_id])
		@product = Product.find_by(id: params[:id]).try(:destroy)

		
		
	end
end


private

  def product_params
    params.require(:product).permit(:user_id, :title, :description, :deadline)
  end
end