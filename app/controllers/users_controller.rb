class UsersController < ApplicationController

	def index
		@users = User.all

		respond_to do |format|
			format.html {}
			format.json {render json: @users}
		end	
	end

	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.html {}
			format.json {render json: @user}
		end
	end

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)

		if @user.save
			respond_to do |format|
				format.html {redirect_to sessions_new_path}
				format.json {render json: @user}
			end
		else
			respond_to do |format|
				format.html {render :new}
				format.json {render json: {error: 'NOPE', status: 400}}
			end	
		end	
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :name, :email_address)
	end
end