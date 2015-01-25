class EventsController < ApplicationController

  def index

  end

  def new
  end

  def create
  end

  def show
    # @event = Event.find_by_id
    ### BOOKMARK << finish defining @event to use on 
    ###              show.html.erb
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