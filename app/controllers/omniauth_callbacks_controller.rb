class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
    auth = request.env["omniauth.auth"]
    @user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.from_omniauth(auth,request.env['omniauth.params'])
    if @user.persisted?
      sign_in(@user, :bypass => true)
      redirect_to posts_path
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end

end