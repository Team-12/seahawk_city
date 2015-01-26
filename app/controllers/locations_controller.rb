
class LocationsController < ApplicationController

    def index
        @locations = Location.all
        @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
            marker.lat location.latitude
            marker.lng location.longitude
        end
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
                # return reverse_geocoded_address

                # The code below works and can add site to DB only if geocoded_by :address is commented out in models>location.rb
                # Has something to do with this: http://www.rubydoc.info/github/alexreisner/geocoder/master/frames#Forward_and_Reverse_Geocoding_in_the_Same_Model

                @location = Location.create(reverse_geocoded_address)
                redirect_to locations_path

            end
        else
            #GEOCODE BY ADDRESS to Get Longitude & Latitude
            @lat_long_array = Geocoder.coordinates(address)
            latitude = @lat_long_array[0]
            longitude = @lat_long_array[1]
            existing_location = Location.find_by_latitude_and_longitude(latitude, longitude)
            if existing_location
                #IF it's an existing location, we should add photo to existing MapFlag
                render json: existing_location
            else
                #IF it's not an existing location, create a new MapFlag and attach image
                # render json: address_hash
                @location = Location.create(address_hash)
                redirect_to locations_path
            end
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

    def address_hash
        form_entry_hash = {
            "address_street" => params[:location][:address_street],
            "address_city" => params[:location][:address_city],
            "address_state" => params[:location][:address_state],
            "address_zip" => params[:location][:address_zip],
            "address_country" => params[:location][:address_country],
            "latitude" => @lat_long_array[0]
            # "longitude" => @lat_long_array[1]
            #one or other of lat and long works, but with both it breaks...WHY???
        }
    end

    def reverse_geocoded_address
        address_array = Geocoder.search(@lat_long_string)
        first_match = address_array.first
        parsed_address_hash = {
            "address_street" => first_match.street_number+" "+first_match.route,
            "address_city" => first_match.city,
            "address_state" => first_match.state_code,
            "address_zip" => first_match.postal_code,
            "address_country" => first_match.country_code

            # TRIED BELOW FOR LAT/LONG... Needs fixing
            # "latitude" => first_match.lat,
            # "longitude" => first_match.lng
            # "latitude" => params[:location][:latitude].to_f,
            # "longitude" => params[:location][:longitude].to_f
            # "country_full" => first_match.country,
            # "address" => first_match.address
        }
        # render json: street+", "+city+", "+state+", "+zip+", "+country
        # render json: parsed_address_hash
    end

end


