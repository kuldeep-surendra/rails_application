class UsersController < ApplicationController
	# before_action :find_id
	def new
		@user = User.new
	end

	def create
		@user = User.new(params_user)
		if @user.save
			session[:user_id] = @user.id
			#binding.pry
			# @user = User.find_by_id(params[:user_id])
      		redirect_to home_path
		else
			redirect_to user_new_path
		end
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		@user.update_attributes(params_user)
		redirect_to user_events_new_path
	end

	private
	def params_user
		params.require(:user).permit(:firstname,:lastname,:username,:email,:phonenumber,:password,:password_confirmation)
	end

	# def find_id
	# 	@user = User.find_by_id(params[:user_id])
	# end
end
