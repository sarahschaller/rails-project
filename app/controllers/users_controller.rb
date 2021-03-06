class UsersController < ApplicationController
	def index 
	end

	def new 
		@user = User.new 
	end

	def create 
		@user = User.new(user_params)
		if @user.valid? 
			@user.save 
			session[:user_id] = @user.id 
			redirect_to user_path(@user)
		else 
			render 'new'
		end 
	end 


	def show 
		if session[:user_id]
			@user = User.find(session[:user_id])
		end
	end

	def edit 
	end 

	def update 
	end 

	def destroy 
		@user.destroy 
		session.delete :user_id 
		@current_user = nil 
		redirect_to root_path 
	end

	private 
	def user_params
		params.require(:user).permit(:title, :first_name, :last_name, :email, :password)
	end


end