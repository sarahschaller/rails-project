class UsersController < ApplicationController
	def index 
	end

	def new 
		@user = User.new 
	end

	def create 
		if (user = User.create user_params)
			session[:user_id] = user.id 
			redirect_to user_path(user)
		else 
			render 'new'
		end 
	end 

	def show 
		@user = User.find_by(id:params[:id])
	end 

	def classrooms_index 
		@user = User.find(params[:id])
		@classrooms = @user.classrooms 
		render template: 'classrooms/index'
	end 

	def classroom 
		@user = User.find(params[:id])
		@classroom = Classroom.find(params[:classroom_id])
		render template: 'classrooms/show'
	end

	private 
	def user_params
		params.require(:user).permit(:title, :first_name, :last_name, :email, :password)
	end


end