class SiteController < ApplicationController

  def index

    # TODO: If no session exists, render /about, else render /
    # if current_user
      @user = current_user
    # else
    #   render "about"
    # end

    # TODO: Don't use .all here - Need to find by date (only >= today), then pipe to .near
    @nearby = Event.all.sort_by{|event| event.date}
    # if params[:latitude] && params[:longitude]
    #     @nearby = Event.location.near("#{params[:latitude]}, #{params[:longitude]}", 1)
    # else
    #     @nearby = Event.location.near("Seattle,WA")
    # end

    # TODO: Don't hardcode this
    @user_pin = [47.62326,-122.33025] # this will be replaced with gps from phone of user
    if @user && @user.checkins.any?
      @last_user_checkin = Checkin.where("user_id = ?", @user.id).order("created_at").last
      if @last_user_checkin.checkinable_type == "Event"
        @checkin_location_latitude = @last_user_checkin.checkinable.location.latitude
        @checkin_location_longitude = @last_user_checkin.checkinable.location.longitude
      else
        @checkin_location_latitude = @last_user_checkin.checkinable.latitude
        @checkin_location_longitude = @last_user_checkin.checkinable.longitude
      end
    else
      @checkin_location_latitude = @user_pin[0]
      @checkin_location_longitude = @user_pin[1]
    end

    @locations = Location.all
    @events = Event.all
    @checkins = Checkin.all

    @location_hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow render_to_string(:partial => "/partials/marker", :locals => { :object => location })
      marker.picture({
        "url" => "https://s3.amazonaws.com/uploads.hipchat.com/39979/1426756/Gyhorx6vyPkjyto/12flags_blue.png",
        "width" => 32,
        "height" => 32
        })
    end

    @event_hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.location.latitude
      marker.lng event.location.longitude
      marker.infowindow render_to_string(:partial => "/partials/marker", :locals => { :object => event })
      marker.picture({
        "url" => "https://s3.amazonaws.com/uploads.hipchat.com/39979/1426756/cq3m4mJmN3WQHBL/12flags_green.png",
        "width" => 32,
        "height" => 32
        })
    end

    @hash = @location_hash + @event_hash

  end

  def about
  end


end