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
    ### TODO: Save user's locations & checkins to instance variables here --PH--
    # @locations = Location.find_by_user_id(@user.user_id)

    ### This is just temporary until above is done. --PH--
    @locations = nil
    @checkins = nil
  end

  def edit_profile
    @user = current_user
    #edit my profile (get)
  end

  def update_profile
    # render json: params
    @user = current_user
    @user.update!(user_params)

    #patch my profile (update)
    redirect_to profile_path
  end

  ###
  def user_params
    params.require(:user).permit(:user_name,:email,:password,:password_confirmation,:is_business_owner)
  end

end


# reserving users/:id for future admin ad user control. suggestion per Lenny