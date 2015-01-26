class LocationsController < ApplicationController

    def index
        @user = current_user
        #made up html5 api gps static location
        @recent_checkin = Location.order("created_at").last
        @user_pin = [47.62326,-122.33025]
        @locations = Location.all
        @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
            marker.lat location.latitude
            marker.lng location.longitude
            marker.infowindow location.address
        end
    end

    def new
        @location = Location.new
    end


    def create
        #If Search Field is filled in...
        if params[:location][:address]
            #GEOCODE BY ADDRESS to Get Longitude & Latitude
            #AND REVERSE-GEOCODE on Result to keep data normalized
            @lat_long_array = Geocoder.coordinates(address)
            latitude = @lat_long_array[0].to_s
            longitude = @lat_long_array[1].to_s
            @lat_long_string = latitude + ", " + longitude
            existing_location = Location.find_by_latitude_and_longitude(latitude, longitude)
                if existing_location
                    #IF it's an existing location, we should add photo to existing MapFlag
                    render json: existing_location
                else
                    #IF it's not an existing location, create a new MapFlag and attach image
                    # render json: address_hash
                    @location = Location.create(search_address_hash)

                    #Returns all locations in the database within 1 mile of newly created location (first object in array is the newly created site itself)
                    nearby_locations = Location.near((@location), 1)
                    render json: nearby_locations
                    # redirect_to locations_path
                end
        else
            if (params[:location][:latitude] != "") and (params[:location][:longitude] != "")
                #REVERSE-GEOCODE to Get Address Details
                existing_location = Location.find_by_latitude_and_longitude(params[:location][:latitude],params[:location][:longitude])
                if existing_location
                    #IF it's an existing location, we should add photo to existing MapFlag
                    redirect_to new_location_path
                else
                    #IF it's not an existing location, create a new MapFlag and attach image
                    @lat_long_string = params[:location][:latitude]+", "+params[:location][:longitude]
                    #Return reverse_geocoded_address
                    @location = Location.create(reverse_geocoded_address)

                    #Returns all locations in the database within 1 mile of newly created location (first object in array is the newly created site itself)
                    nearby_locations = Location.near((@location), 1)
                    render json: nearby_locations
                    # redirect_to locations_path

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
                    # IF it's not an existing location, create a new MapFlag and attach image
                    # render json: address_hash
                    @location = Location.create(address_hash)

                    # Returns all locations in the database within 1 mile of newly created location (first object in array is the newly created site itself)
                    nearby_locations = Location.near((@location), 1)
                    render json: nearby_locations
                    # redirect_to locations_path
                end
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
        address_search = params[:location][:address]
        # .compact removes the nil values so string can concatenate properly
        return [street, city, state, zip, country, address_search].compact.join(', ')
    end

    def address_hash
        form_entry_hash = {
            "name" => params[:location][:name],
            "desc" => params[:location][:desc],
            "address_street" => params[:location][:address_street],
            "address_city" => params[:location][:address_city],
            "address_state" => params[:location][:address_state],
            "address_zip" => params[:location][:address_zip],
            "address_country" => params[:location][:address_country],
            "latitude" => @lat_long_array[0],
            "longitude" => @lat_long_array[1],
            "address" => params[:location][:address]
        }
    end

    def search_address_hash
        address_array = Geocoder.search(@lat_long_string)
        first_match = address_array.first
        # We can use if statements to determine which value to add to database if fields are filled in that contradict with reverse-geocode results
        if params[:location][:name] != ""
            name_value = params[:location][:name]
        else
            name_value = params[:location][:address]
        end
        search_hash = {
            "name" => name_value,
            "desc" => params[:location][:desc],
            "latitude" => @lat_long_array[0],
            "longitude" => @lat_long_array[1],
            "address_street" => first_match.street_number+" "+first_match.route,
            "address_city" => first_match.city,
            "address_state" => first_match.state_code,
            "address_zip" => first_match.postal_code,
            "address_country" => first_match.country_code,
            "address" => params[:location][:address]
        }
    end

    def reverse_geocoded_address
        address_array = Geocoder.search(@lat_long_string)
        first_match = address_array.first
        parsed_address_hash = {
            "name" => params[:location][:name],
            "desc" => params[:location][:desc],
            "address_street" => first_match.street_number+" "+first_match.route,
            "address_city" => first_match.city,
            "address_state" => first_match.state_code,
            "address_zip" => first_match.postal_code,
            "address_country" => first_match.country_code,
            "latitude" => first_match.latitude,
            "longitude" => first_match.longitude,
            "address" => params[:location][:address]
        }
    end

end


