class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def moves
		auth_hash = request.env["omniauth.auth"]

		access_token = auth_hash['credentials']['token']

		moves = Moves::Client.new(access_token)
		#save the access token to the user model for future reference
		current_user.update(moves_token: access_token)

		redirect_to root_path
  end
end
