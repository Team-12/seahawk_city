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