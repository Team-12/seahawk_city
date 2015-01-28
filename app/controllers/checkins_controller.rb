class CheckinsController < ApplicationController



    def index
    end

    def new
        @checkin = Checkin.new
        # @nearby = Location.all
        # @nearby = [];
        if params[:latitude] && params[:longitude]
            @nearby = Location.near("#{params[:latitude]}, #{params[:longitude]}", 1)
        else
            @nearby = Location.near("Seattle,WA")
        end

    end

    def create


        # if params[:checkin][:checkinable_type] == "location"
        #     #get selected locations from db
        #     c = Location.find_by_id(params[:checkin][:checkinable_id])
        # else
        #     #get selected event from db
        #     c = Event.find_by_id(params[:checkin][:checkinable_id])
        # end

        if params[:checkin][:checkinable_type] == "location"
            checkinable = Location.find_by_id(params[:checkin][:checkinable_id])
        elsif params[:checkin][:checkinable_type] == "event"
            checkinable = Event.find_by_id(params[:checkin][:checkinable_id])
        else
            if params[:checkin][:locations][:address_city]
                checkinable = Location.create({name: params[:checkin][:locations][:name], desc: params[:checkin][:locations][:desc], address_street: params[:checkin][:locations][:address_street], address_city: params[:checkin][:locations][:address_city],address_state: params[:checkin][:locations][:address_state], address_zip: params[:checkin][:locations][:address_zip], address_country: params[:checkin][:locations][:address_country],latitude: params[:checkin][:locations][:latitude], longitude: params[:checkin][:locations][:longitude]})
            else
                checkinable = Location.create_from_geocoder(params[:checkin][:locations][:address_street])
            end
        end

        result = capture_image params[:checkin][:photo].path

        @current_user.checkins << checkinable.checkins.create({photo_url: result['public_id'], note: params[:checkin][:note], latitude: params[:checkin][:latitude], longitude: params[:checkin][:longitude]})
        render json: result
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

