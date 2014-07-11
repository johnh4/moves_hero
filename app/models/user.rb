class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, omniauth_providers: [:moves]
	scope :movers, -> { where.not(moves_token: nil) }

	#verify the Moves access token
	def valid_token?
		if self.moves_token.presence
			response = HTTParty.get('https://api.moves-app.com/oauth/v1/tokeninfo?access_token='+
				self.moves_token)
			puts "response.code: #{response.code}"
			response.code == 200
		else
			false
		end
	end
end
