class SessionsController < ApplicationController


    def new
      @user = User.new
    end

    def create
      @user = User.authenticate(params[:user][:email], params[:user][:password])

      if @user
        session[:user_id] = @user.id
        flash[:success] = "Welcome back, #{@user.user_name}"
        redirect_to "/"
      else
        flash[:danger] = "Sorry. Try again?"
        render :new
      end

    end

    def destroy
      reset_session
      redirect_to root_path
    end

end
