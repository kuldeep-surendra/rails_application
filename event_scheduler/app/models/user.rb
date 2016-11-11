class User < ActiveRecord::Base
	validates_uniqueness_of :email
	has_secure_password
	has_many :invitations,foreign_key: :invitee_id
	has_many :events,through: :invitations
end
