class CheckinsController < ApplicationController



    def index
    end

    def new
        @checkin = Checkin.new
    end

    def create
        result = capture_image params[:checkin][:photo].path
        @current_user.checkins << Checkin.create({photo_url: result['public_id'], note: params[:checkin][:note], latitude: params[:checkin][:latitude], longitude: params[:checkin][:longitude]})
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

