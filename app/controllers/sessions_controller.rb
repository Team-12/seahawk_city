class SessionsController < ApplicationController


    def new
    end

    def create
    end

    def destroy
        render :text => "logged out"
    end

end
