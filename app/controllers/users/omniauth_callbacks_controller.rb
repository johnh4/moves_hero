class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def moves
		auth_hash = request.env["omniauth.auth"]
		render text: auth_hash.inspect
=begin
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Moves") if is_navigational_format?
    else
      session["devise.moves_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
=end
  end
end
