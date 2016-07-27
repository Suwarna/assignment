class RegistrationsController < Devise::RegistrationsController
	def create
		@user = User.new(user_params)
    if @user.save
    	@user.picture = Picture.create(picture_params)
    	@user.save
    	sign_in @user, :bypass => true
    	#flash[:notice] = "Welcome! You have signed up successfully."
    	redirect_to posts_path
    else
    	flash[:error] = "Please try again with fixing following errors."
    	puts @user.errors.messages
    	redirect_to root_path
    end
	end

	private

	def user_params
    params.require(:user).permit(:firstname, :lastname,
     :username, :email, :password, :password_confirmation)
  end

  def picture_params
  	params.require(:user).require(:picture).permit(:photo)
  end
end