class HomeController < ApplicationController
  def index
		if user_signed_in? && current_user.valid_token?
			token = current_user.moves_token
			@moves = Move.new(token)
			@walk_month_summary = @moves.walk_month_summary.reverse
			@movers_daily = User.movers.order(steps_today: :desc)
			@movers_monthly = User.movers.order(steps_month: :desc)
		end
  end
	def month
		if user_signed_in? && current_user.valid_token?
			token = current_user.moves_token
			@moves = Move.new(token)
			@month_steps = @moves.month_steps
			@month_days = @moves.month_days
		end
	end
end
