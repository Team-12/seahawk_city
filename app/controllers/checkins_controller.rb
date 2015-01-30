class CheckinsController < ApplicationController

    def index
    end

    def new
        @user = current_user
        # if !user, error, redirect to index with flash "log in"
        @checkin = Checkin.new
        if params[:latitude] && params[:longitude]
            @nearby = Location.near("#{params[:latitude]}, #{params[:longitude]}", 1)
        else
            # @nearby = Location.near("Seattle,WA")
            flash[:danger] = "We were unable to determine your location, please make sure GPS is enabled"
            redirect_to root_path
        end
    end


    def create

        @user = current_user

        if params[:checkin][:photo] == ""
            flash[:danger] = "You must submit a photo to check in!"
            redirect_to new_checkin_path
        else
            image_data = capture_image params[:checkin][:photo].path
        end

        case params[:checkin][:checkinable_type]
        when "location"
            checkinable = Location.find_by_id(params[:checkin][:checkinable_id])
        when "event"
            checkinable = Event.find_by_id(params[:checkin][:checkinable_id])
        when "new"
            checkinable = Location.create_from_geocoder(params[:checkin][:locations][:address])
        else
            flash[:danger] = "You must select a location or event to check in!"
            redirect_to new_checkin_path
        end
        # binding.pry
        # @user.checkins << Checkin.create({photo_url: image_data['public_id'], note: params[:checkin][:note], latitude: params[:checkin][:latitude], longitude: params[:checkin][:longitude], checkinable_type: params[:checkin][:checkinable_type],checkinable_id: checkinable.id })
        @user.checkins << checkinable.checkins.create({photo_url: image_data['public_id'], note: params[:checkin][:note], latitude: params[:checkin][:latitude], longitude: params[:checkin][:longitude]})
        flash[:success] = "You have succesfully checked in"
        redirect_to root_path
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end


end

