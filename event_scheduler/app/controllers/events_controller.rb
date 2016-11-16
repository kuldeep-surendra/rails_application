class EventsController < ApplicationController
	before_filter :find_user_id,:find_users
	def new
		@event = Event.new
		@events = Event.all
	end

	def create
		# binding.pry
		@event = Event.new(params_event)
		# @event.owner_id = current_user.id
		if @event.save
			#binding.pry
			params["invitee_ids"].each do |a|
				@invitation = Invitation.new
				@invitation.inviter_id = params["event"]["owner_id"]
				@invitation.invitee_id = a
				@invitation.event_id = Event.last.id
				@invitation.save
			end
			# @var = @event.id
			# @invi = Invitation.new(params_inivi)
			# @invi.save
			# @event.invitations << User.find(params['invitee_ids'])
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
		@events = Event.all
	end

	def edit
		# binding.pry
		# i = 0
		@event = Event.find_by_id(params[:id])
		# var = @event.invitations
		# @event.invitations do |a|
			# a[i].invitee_id.clear
			# i = i + 1
		# end
	end

	def update
		binding.pry
		@event = Event.find_by_id(params[:id])
		if current_user.id == @event.owner_id
			@event.update_attributes(params_event)
			params["invitee_ids"].each do |a|
				@invitation = Invitation.new
				@invitation.inviter_id = params["event"]["owner_id"]
				@invitation.invitee_id = a
				@invitation.event_id = @event.id
				@invitation.save
			end
		else
			redirect_to error_path
		end

		redirect_to user_events_new_path
	end

	def error
		
	end

	private
	def params_event
		params.require(:event).permit(:event_name,:venue,:date,:time,:description,:status,:owner_id,:invitation)
	end

	# def params_inivi
	# 	params.require(:invitation).permit(:inviter_id,:event_id,:invitee_id)
	# end
	def find_user_id
		@user = User.find_by_id(params[:id])
	end
	def find_users
		@users = User.all
	end
end
