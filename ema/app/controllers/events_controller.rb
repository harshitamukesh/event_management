class EventsController < ApplicationController
      before_filter :edit_event, :find_user

    def new
        @users=User.all
        @event=Event.new
        @events=Event.all
    end

    def create
        @event=Event.new(event_params)
        @event.owner_id=params[:user_id]
        @event.save
        params[:invitee_ids].each do |t|
           @invitation=Invitation.new
           @invitation.event_id=@event.id
           @invitation.invitee_id=t
           @invitation.invited_id=params[:user_id]
           @invitation.save
   			end
        redirect_to event_list_path

    end

    def index
        @events=Event.all
        @users=User.all
    end

    def edit
        @users=User.all
        @event=Event.find_by_id(params[:id])
        
    end

    def update
        @event=Event.find_by_id(params[:id])
        @event.update_attributes(event_params)
         redirect_to event_list_path(@event)
    end

    private
    def event_params
      params.require(:event).permit(:title, :venu,:date,:time,:invitees,:description,:status,:owner_id)
    end

    def edit_event
        @event_edit=Event.find_by_id(params[:id])
    end

    def find_user
        @user=User.find_by_id(params[:user_id])
    end
     
end
