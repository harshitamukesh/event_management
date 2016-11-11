class EventsController < ApplicationController
	before_filter :authorize
	def new
		@event=Event.new
	end

end
