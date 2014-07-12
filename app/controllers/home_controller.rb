class HomeController < ApplicationController
  def index
		if user_signed_in? && current_user.valid_token?
			token = current_user.moves_token
			@moves = Move.new(token)
			#@summary = @moves.daily_summary
			#@month_summary = @moves.month_summary
			#@month_steps = @moves.month_steps
			#@month_days = @moves.month_days
			@walk_month_summary = @moves.walk_month_summary.reverse
			@movers_daily = User.movers.order(steps_today: :desc)
			@movers_monthly = User.movers.order(steps_month: :desc)
		end
  end
	def leaderboard
		@movers_daily = User.movers.order(steps_today: :desc)
		@movers_monthly = User.movers.order(steps_month: :desc)
		if user_signed_in? && current_user.valid_token?
			@token = current_user.moves_token
			@moves = Move.new(@token)
			@summary = @moves.daily_summary
			@month_summary = @moves.month_summary
			@month_steps = @moves.month_steps
			@month_days = @moves.month_days
			puts "@moves: #{@moves}"
			puts "@month_days before: #{@month_days}"
			puts "@month_days after: #{@month_days}"
			puts "@moves.profile: #{@moves.profile}"
			puts "@moves.daily_summary(Time.now): #{@moves.daily_summary(Time.now)}"

			@walk_month_summary = @moves.walk_month_summary.reverse
		end
	end

	def month
		if user_signed_in? && current_user.valid_token?
			token = current_user.moves_token
			@moves = Move.new(token)
			#@summary = @moves.daily_summary
			#@month_summary = @moves.month_summary
			@month_steps = @moves.month_steps
			@month_days = @moves.month_days
		end
	end
end
