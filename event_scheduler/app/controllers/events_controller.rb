class EventsController < ApplicationController
	before_filter :find_user_id
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params_event)
		if @event.save
			# @var = @event.id
			@var1 = @user.id
			redirect_to user_events_show_path
		else
			redirect_to user_events_path
		end		
	end

	def show
		binding.pry
		@event = Event.find_by_id(params[:id])
	end

	private
	def params_event
		params.require(:event).permit(:event_name,:venue,:date,:time,:description,:invitees,:status)
	end
	def find_user_id
		@user = User.find_by_id(params[:id])
	end
end
