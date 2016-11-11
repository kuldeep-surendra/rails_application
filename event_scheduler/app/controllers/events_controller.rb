class EventsController < ApplicationController
	before_filter :find_user_id,:find_users
	def new
		@event = Event.new
		3.times do
			@event.invitations.build
		end
	end

	def create
		binding.pry
		@event = Event.new(params_event)
		@invi = Invitation.new(params_inivi)
		@invi.save
		if @event.save
			binding.pry
			# @var = @event.id
			@event.invitations << User.find(params['invitee_ids'])
			redirect_to user_events_show_path
		else
			redirect_to user_events_path
		end		
	end

	def show
		@events = Event.all
	end
	def form
		@event = Event.new
	end

	private
	def params_event
		params.require(:event).permit(:event_name,:venue,:date,:time,:description,:status,:owner_id,:invitation)
	end

	def params_inivi
		params.require(:invitation).permit(:inviter_id)
	end
	def find_user_id
		@user = User.find_by_id(params[:id])
	end
	def find_users
		@users = User.all
	end
end
