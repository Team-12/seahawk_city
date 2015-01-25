class EventsController < ApplicationController

  def index

  end

  def new
    @event = Event.new
  end

  def create
  end

  def show
    @event = Event.find_by_id(params[:id])
    if @event
      # Display page
      render :show
    else
      # Error: Event not found
    end
  end

  def edit
  end

  def update

  end

  def destroy
  end

  ###
  def event_params
    params.require(:event).permit(:name,:desc,:date,:start_time,:end_time,:photo_url)
  end

end