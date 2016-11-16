class Event < ActiveRecord::Base
   has_many :invitations
   has_many :invitees, through: :invitations, foreign_key: :invitee_id
   belongs_to :owner,class_name: "User"
end
