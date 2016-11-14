class InvitationsController < ApplicationController
	# before_action :find_event
	def new
		@invitation = Invitation.new
		@user = User.find_by_id(params[:user_id])
		@users = User.all
	end

	def create
		binding.pry
		# @invitation = Invitation.new(params_invitation)
		# @invitation.save
		# @event.invitations << params["invitee_ids"]
		params["invitee_ids"].each do |a|
			@invitation = Invitation.new
			@invitation.inviter_id = params["invitation"]["inviter_id"]
			@invitation.invitee_id = a
			@invitation.event_id = Event.last.id
			@invitation.save
		end
		redirect_to event_form_path
	end

	private
	def params_invitation
		params.require(:invitation).permit(:inviter_id,:event_id,:invitee_id)
	end
	# def find_event
		# @event = Event.find_by_id(params[:id])
	# end
end
