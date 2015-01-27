class EventsController < ApplicationController

  def index

  end

  def new
    @event = Event.new
  end

  def create
  end

  def nearby
  end

  def show
    # TODO: Switch this line for the one below when ready to use real param value
    @event = Event.first
    # @event = Event.find_by_id(params[:id])
    # return render json: @event
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