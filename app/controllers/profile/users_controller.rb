class Profile::UsersController < ApplicationController
  def show

  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_profile_user_path, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private 

  def user_params
  	params.require(:user).permit(:name, :description)
  end

end
