class Profile::UsersController < ApplicationController
  def show
    @user = current_user
    @voted_apps = current_user.find_voted_items

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
  	params.require(:user).permit(:name, :description, :profile_image, :bio_1st_question, :bio_2nd_question, :bio_3rd_question, :social_angelist, :social_github, :social_twitter, :social_facebook)
  end

end
