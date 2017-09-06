class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    logger.debug "ads1"
    #logger.debug User.from_omniauth(request.env["omniauth.auth"])
    #binding.pry
  def all
    logger.debug request.env["omniauth.auth"]
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :google_oauth2, :all
end
