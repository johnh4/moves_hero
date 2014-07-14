namespace :leaderboard do
  desc "Update the leaderboard"
  task update: :environment do
    puts "updating the leaderboard..."

		movers = User.movers
		movers.each do |mover|
			if mover.valid_token?
				puts "new mover"
				moves = Move.new(mover.moves_token)

				#today's steps
				puts "moves.steps_today: #{moves.steps_today}"
				today_steps = moves.steps_today.nil? ? 0 : moves.steps_today
				puts "today_steps: #{today_steps}"
				mover.update!(steps_today: today_steps)

				#this month's steps
				month_steps = moves.month_steps.inject(:+)
				puts "month_steps: #{month_steps}"
				mover.update!(steps_month: month_steps)
			end
		end

		puts "done updating the leaderboard..."
  end
end
