class LocationsController < ApplicationController

    # reverse_geocoded_by :latitude, :longitude
    # after_validation :reverse_geocode  # auto-fetch address

    #avoid unnessary API Requests (only if address present or change since last change); ex:
    #after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }



    def index
        @locations = Location.all
    end

    def new
        @location = Location.new
    end

        # @location = Location.find_or_create_by(latitude: :latitude,longitude: :longitude)
        # @location = Location.where(location_params).where(location.latitude => :latitude, location.longitude => :longitude).first_or_create

    def create
        # @address = params[:location][:address_street].length > 0 ? params[:location][:address_street]+", " : ""+params[:location][:address_city].length > 0 ? params[:location][:address_city]+", "
        # render json: params
        if (params[:location][:latitude] != "") and (params[:location][:longitude] != "")
            #IF there is not a Latitude or Longitude, geocode based on address below

            existing_location = Location.find_by_latitude_and_longitude(params[:location][:latitude],params[:location][:longitude])
            if existing_location
                #IF it's an existing location, we should add photo to existing MapFlag
                redirect_to new_location_path
            else
                @location = Location.create(location_params)
                #IF it's not an existing location, create a new MapFlag and attach image
                redirect_to locations_path
            end
        else
            #GEOCODE BY ADDRESS to Get Longitude & Latitude
            a = Geocoder.coordinates(address)
            render json: a
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

    def address
        if params[:location][:address_street] != ""
            address_street = params[:location][:address_street]+", "
        else
            address_street = ""
        end

        if params[:location][:address_city] != ""
            address_city = params[:location][:address_city]+", "
        else
            address_city = ""
        end

        if params[:location][:address_state] != ""
            address_state = params[:location][:address_state]+", "
        else
            address_state = ""
        end

        if params[:location][:address_zip] != ""
            address_zip = params[:location][:address_zip]+", "
        else
            address_zip = ""
        end

        if params[:location][:address_country] != ""
            address_country = params[:location][:address_country]+", "
        else
            address_country = ""
        end

        return (address_street+address_city+address_state+address_zip+address_country).chomp(", ")
    end

end