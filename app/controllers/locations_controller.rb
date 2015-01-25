class LocationsController < ApplicationController

    def index
        @locations = Location.all
    end

    def new
        @location = Location.new
    end


    def create
        if (params[:location][:latitude] != "") and (params[:location][:longitude] != "")
            #IF there is not a Latitude or Longitude, geocode based on address below
            existing_location = Location.find_by_latitude_and_longitude(params[:location][:latitude],params[:location][:longitude])
            if existing_location
                #IF it's an existing location, we should add photo to existing MapFlag
                redirect_to new_location_path
            else
                #IF it's not an existing location, create a new MapFlag and attach image
                @lat_long_string = params[:location][:latitude]+", "+params[:location][:longitude]
                return geocoded_address

                # The code below works and can add site to DB only if geocoded_by :address is commented out in models>location.rb
                # Has something to do with this: http://www.rubydoc.info/github/alexreisner/geocoder/master/frames#Forward_and_Reverse_Geocoding_in_the_Same_Model

                # @location = Location.create(location_params)
                # redirect_to locations_path

            end
        else
            #GEOCODE BY ADDRESS to Get Longitude & Latitude
            lat_long_array = Geocoder.coordinates(address)
            render json: lat_long_array
        end
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
        params.require(:location).permit(:name,:desc,:longitude,:latitude,:address_street,:address_city,:address_state,:address_zip,:address_country, :address)
    end

    def address
        street = params[:location][:address_street]
        city = params[:location][:address_city]
        state = params[:location][:address_state]
        zip = params[:location][:address_zip]
        country = params[:location][:address_country]

        return [street, city, state, zip, country].compact.join(', ')
    end

    def geocoded_address
        address_array = Geocoder.search(@lat_long_string)
        first_match = address_array.first
        parsed_address_hash = {
            "street" => first_match.street_number+" "+first_match.route,
            "city" => first_match.city,
            "state" => first_match.state_code,
            "zip" => first_match.postal_code,
            "country" => first_match.country_code,
            "country_full" => first_match.country,
            "address" => first_match.address
        }
            # render json: street+", "+city+", "+state+", "+zip+", "+country
        render json: parsed_address_hash
    end

end


