class HomeController < ApplicationController
  def index
		if user_signed_in? && current_user.valid_token?
			@token = current_user.moves_token
			@moves = Moves::Client.new(current_user.moves_token)
			puts "@moves: #{@moves}"
			@summary = @moves.daily_summary
			@last_month = @moves.daily_summary(pastDays: 31)
			puts "@moves.profile: #{@moves.profile}"
			puts "@moves.daily_summary(Time.now): #{@moves.daily_summary(Time.now)}"
		end
  end
	def leaderboard
		@movers = User.movers
	end
end
