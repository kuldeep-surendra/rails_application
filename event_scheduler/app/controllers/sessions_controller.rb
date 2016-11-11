class SessionsController < ApplicationController
	before_filter :find_id
	def new
		
	end

	def create
		binding.pry
		user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to user_events_new_path(user.id)
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
	end

	def destroy
		session[:user_id] = nil
    	redirect_to '/login'
	end

	def find_id
		@user = User.find_by_id(params[:user_id])
	end
end
