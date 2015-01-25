class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      render :new
    else
      flash[:success] = 'User has been created. You can now log in.'
      redirect_to login_path
    end
  end

  def profile
    @user = current_user
    # @locations = Location.find_by_user_id(@user.user_id)
    @locations = nil
    @checkins = nil
  end

  def edit_profile
    #edit my profile (get)
  end

  def update_profile
    #patch my profile (update)
  end

  ###
  def user_params
    params.require(:user).permit(:user_name,:email,:password,:password_confirmation)
  end

end


# reserving users/:id for future admin ad user control. suggestion per Lenny