class CheckinsController < ApplicationController



    def index
    end

    def new
        @checkin = Checkin.new
    end

    def create


        # if params[:checkin][:checkinable_type] == "location"
        #     #get selected locations from db
        #     c = Location.find_by_id(params[:checkin][:checkinable_id])
        # else
        #     #get selected event from db
        #     c = Event.find_by_id(params[:checkin][:checkinable_id])
        # end

        if params[:checkin][:checkinable_type] == "new"
            new_location_id = Location.create({name: params[:checkin][:locations][:name], desc: params[:checkin][:locations][:desc], address_street: params[:checkin][:locations][:address_street], address_city: params[:checkin][:locations][:address_city],address_state: params[:checkin][:locations][:address_state], address_zip: params[:checkin][:locations][:address_zip], address_country: params[:checkin][:locations][:address_country],latitude: params[:checkin][:locations][:latitude], longitude: params[:checkin][:locations][:longitude]}).id
        end

        result = capture_image params[:checkin][:photo].path
        if new_location_id
            checkinable_id = new_location_id
        else
            checkinable_id = params[:checkin][:checkinable_id]
        end
        @current_user.checkins << Checkin.create({photo_url: result['public_id'], note: params[:checkin][:note], latitude: params[:checkin][:latitude], longitude: params[:checkin][:longitude], checkinable_type: params[:checkin][:checkinable_type],checkinable_id: checkinable_id })
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

