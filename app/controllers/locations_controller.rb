class LocationsController < ApplicationController
    # geocoded_by :address
    # after_validation :geocode

    def index
        @locations = Location.all
    end

    def new
        @location = Location.new
    end

    def create
        # @location = Location.find_or_create_by(latitude: :latitude,longitude: :longitude)
        # @location = Location.where(location_params).where(location.latitude => :latitude, location.longitude => :longitude).first_or_create
        existing_location = Location.find_by_latitude_and_longitude(params[:location][:latitude],params[:location][:longitude])
        if existing_location
            redirect_to locations_path
        else
            @location = Location.create(location_params)
            redirect_to new_location_path
        end

        # redirect_to locations_path
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def location_params
        params.require(:location).permit(:name,:desc,:longitude,:latitude,:address_street,:address_city,:address_state,:address_zip,:address_country)
    end

end