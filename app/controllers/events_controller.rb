class EventsController < ApplicationController

  def index
    @events = Event.all

  end

  def new
    @event = Event.new
    if @current_user.is_business_owner == false
      redirect_to profile_path
    end
  end

  def create
     @user = current_user
    if params[:event][:photo] == ""
        flash[:danger] = "You must submit a photo to check in!"
        redirect_to new_event_path
    else
        image_data = capture_image params[:event][:photo].path
    end
    Event.create({photo_url: image_data['public_id'], name: params[:event][:name], desc: params[:event][:desc], date: params[:event][:date], start_time: params[:event][:start_time], end_time: params[:event][:end_time], location_id: params[:event][:location_id], user_id: @user.id})
    #render json: Event.last
    redirect_to events_path
  end

  def nearby
  end

  def show
    # TODO: Switch this line for the one below when ready to use real param value
    @event = Event.find_by_id(params[:id])
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
    params.require(:event).permit(:name,:desc,:date,:start_time,:end_time,:photo_url,:location_id)
  end

end