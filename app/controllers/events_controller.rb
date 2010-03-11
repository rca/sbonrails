class EventsController < ApplicationController
  skip_before_filter :login_required
  def index
    @events = Event.all
  end
  
  def new
    @event  = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
        flash[:success] = "saved successfully"
        redirect_to root_url
     else
       flash[:error] = "could not save the event"
       redirect_to root_url
    end 
  end
  
end
