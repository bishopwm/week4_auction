class BidsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@bid = @user.bids.new(bid_params)
		if @bid.valid?
			@bid.save
			redirect_to user_bids_path, notice: "Post was successfull!"
		end
	end

	def new
		@user = User.find(params[:user_id])
		@bid = @user.bids.new
	end
	
	def index
		@user = User.find(params[:user_id])
		@bids = @user.bids
		@bid = @user.bids.new
	end

	def show
		@bid = Bid.find(params[:id])
	end

	private

  	def bid_params
    	params.require(:bid).permit(:user_id, :name, :bid)
  	end

end


