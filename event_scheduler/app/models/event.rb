class Event < ActiveRecord::Base
	attr_accessible :invitations_attributes
	belongs_to :owner,class_name: "User"
	has_many :invitees,through: :invitations,foreign_key: :invitee_id
	has_many :invitations
	accepts_nested_attributes_for :invitations
end
