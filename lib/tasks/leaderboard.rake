namespace :leaderboard do
  desc "Update the leaderboard"
  task update: :environment do
    puts "updating the leaderboard..."

		movers = User.where.not(moves_token: nil)
		puts "movers: #{movers}"
		movers.each do |mover|
			if mover.valid_token?
				puts "new mover"
				client = Moves::Client.new(mover.moves_token)
				#today's steps
				steps = client.daily_summary[0]['summary'][0]['steps']
				mover.update!(steps_today: steps)
				#this month's steps
				month = Date.today.strftime("%Y-%m")
				month_summary = client.daily_summary(month)
				puts "month_summary: #{month_summary}"
				#sum the month's steps, by day
				month_steps = month_summary.inject(0) do |sum,day|
					unless day['summary'].nil?
						details = day["summary"].find { |a| a["group"] == "walking"}
						sum + details["steps"] 
					else
						sum + 0
					end
				end
				puts "month_steps: #{month_steps}"
				mover.update!(steps_month: month_steps)
			end
		end

		puts "done updating the leaderboard..."
  end
end
